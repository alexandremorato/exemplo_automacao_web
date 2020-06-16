FROM sickp/alpine-ruby:2.5.1-r1

RUN apk update \
    && apk upgrade \
    && apk add --update \
    tzdata \
    git \
    linux-headers \
    build-base \
    imagemagick \
    imagemagick-dev \
    freetds-dev \
    && rm -rf /var/cache/apk/*

ENV app_path /opt/jenkins/
WORKDIR ${app_path}

COPY Gemfile* ${app_path}

RUN bundle install


COPY . ${app_path}