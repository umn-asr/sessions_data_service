ARG ORACLE_IC_VERSION="19.19"
ARG RUBY_VERSION="3.2.2"

### base ###
FROM ruby:$RUBY_VERSION-slim AS base

ARG GID=1000
ARG ORACLE_IC_VERSION
ARG PORT=3000
ARG TARGETPLATFORM
ARG UID=1000

ENV HOME="/home/app"
ENV NLS_LANG="AMERICAN_AMERICA.WE8ISO8859P1"
ENV PORT=$PORT
ENV TZ="America/Chicago"
ENV VAULT_ADDR="https://hcp-vault-private-vault-fc507e0d.5d5b1f21.z1.hashicorp.cloud:8200"
ENV VAULT_LOG_LEVEL="info"
ENV VAULT_NAMESPACE="admin/asr"

EXPOSE $PORT
WORKDIR $HOME

# configure the app user
RUN groupadd -g $GID app \
  && useradd --create-home --no-log-init -u $UID -g $GID app \
  && chown app:app -R $HOME

# install production dependencies
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  curl \
  gnupg \
  libaio1 \
  unzip \
  && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*

# Install HCP Vault
RUN curl -o - https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=VERSION_CODENAME=).*' /etc/os-release) main" | tee /etc/apt/sources.list.d/hashicorp.list \
    && apt-get update -qq \
    && apt-get install -y --no-install-recommends \
    vault-enterprise \
    && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*

# install the oracle instant client
COPY script/_install_oracle install_oracle
RUN ./install_oracle && rm install_oracle


### builder ###
FROM base AS builder

ARG PROCESSORS="8"
ENV MAKE="make --jobs ${PROCESSORS}"

# install development dependencies
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  build-essential \
  ca-certificates \
  git \
  && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*


### bundle ###
FROM builder AS bundle

WORKDIR "/tmp"

# install production ruby gems
COPY Gemfile Gemfile.lock ./
RUN bundle config set deployment "true" \
  && bundle config set without "development test" \
  && bundle install


### production ###
FROM base AS production

ARG GIT_COMMIT

ENV GIT_COMMIT=$GIT_COMMIT
ENV RAILS_LOG_TO_STDOUT="true"

# copy the application files
COPY --chown=app:app . $HOME
COPY --from=bundle /usr/local/bundle /usr/local/bundle
COPY --from=bundle --chown=app:app /tmp/vendor/bundle "${HOME}/vendor/bundle"
COPY --chown=app:app config/database.deploy.yml "${HOME}/config/database.yml"

# start the app
USER app
ENTRYPOINT [ "script/_vault_entrypoint" ]
CMD ["vault", "agent", "-config", "/home/app/agent.hcl"]


### development ###
FROM builder AS development

# install development ruby gems
COPY Gemfile Gemfile.lock ./
RUN bundle install \
  && chown app:app -R /usr/local/bundle

# copy the application files
COPY --chown=app:app . $HOME

# start the app
USER app
ENTRYPOINT [ "script/_entrypoint.sh" ]
CMD ["script/_server"]
