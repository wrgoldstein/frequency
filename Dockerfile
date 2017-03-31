FROM elixir:1.4.0

RUN mix local.hex --force
RUN mix local.rebar --force

ENV PHOENIX_VERSION 1.2.0

# install the Phoenix Mix archive
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phoenix_new-$PHOENIX_VERSION.ez

RUN apt-get update && \
      apt-get -y install sudo

ADD . /app
WORKDIR /app
ENV PORT 4000
ENV MIX_ENV prod
RUN mix deps.get
RUN mix compile
RUN mix phoenix.digest
CMD mix phoenix.server
