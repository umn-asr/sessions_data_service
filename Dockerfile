# Build Lastpass CLI in separate build container
FROM asr-docker-local.artifactory.umn.edu/ruby_3_2_2_node_18_oracle:0.0.2 as sessions
ARG BUNDLER_VERSION="2.3.26"

WORKDIR /app

ENV MAKE="make --jobs 8"

COPY Gemfile Gemfile.lock ./

RUN gem install bundler:$BUNDLER_VERSION

RUN bundle install

COPY . .

CMD rails s
