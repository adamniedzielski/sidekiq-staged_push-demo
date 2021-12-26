FROM ruby:3.0.2-alpine AS base
RUN apk add build-base postgresql-dev tzdata git bash
WORKDIR /app
ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

FROM base AS dev
RUN bundle config local.sidekiq-staged_push /sidekiq-staged_push

FROM base AS ci
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . ./
