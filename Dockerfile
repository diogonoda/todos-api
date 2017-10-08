FROM ruby:2.4.1
MAINTAINER diogonoda@hotmail.com

ENV RAILS_VERSION 5.0.6

RUN apt-get update \
 && apt-get install -y nodejs --no-install-recommends \
 && gem install rails --version "$RAILS_VERSION"

WORKDIR /usr/src/app

ADD . /usr/src/app

RUN bundle install --without production
