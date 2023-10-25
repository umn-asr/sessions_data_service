# Build Lastpass CLI in separate build container
FROM gcc:13 AS lpass_builder
ARG LASTPASS_VERSION="1.3.6"

RUN apt-get --allow-releaseinfo-change update && \
    apt-get --no-install-recommends -yqq install \
    bash-completion \
    build-essential \
    cmake \
    libcurl4  \
    libcurl4-openssl-dev  \
    libssl-dev  \
    libxml2 \
    libxml2-dev  \
    pkg-config \
    ca-certificates \
    xclip
RUN mkdir -p /etc/lastpass-cli && cd /etc/lastpass-cli

# Download and extract lastpass-cli
RUN curl -fsSL https://github.com/lastpass/lastpass-cli/archive/v$LASTPASS_VERSION.tar.gz -o lastpass-cli.tar.gz
RUN tar -xzf lastpass-cli.tar.gz -C /etc/lastpass-cli --strip-components 1

RUN mkdir -p /lpass

RUN export PATH="/usr/bin:$PATH" && export OPENSSL_ROOT_DIR=/usr/bin && export CFLAGS="-fcommon" && cd /etc/lastpass-cli && PREFIX=/lpass make && PREFIX=/lpass make install

# Build main image based off an image we have already created
FROM asr-docker-local.artifactory.umn.edu/ruby_3_2_2_node_18_oracle:0.0.2 as sessions
ARG BUNDLER_VERSION="2.3.26"

COPY --from=lpass_builder /lpass/bin/lpass /usr/bin/lpass

WORKDIR /app

ENV MAKE="make --jobs 8"

COPY Gemfile Gemfile.lock ./

RUN gem install bundler:$BUNDLER_VERSION

RUN bundle install

COPY . .

CMD rails s
