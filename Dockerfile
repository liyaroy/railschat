FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /rails-chat-tutorial
WORKDIR /rails-chat-tutorial

ADD Gemfile /rails-chat-tutorial/Gemfile
ADD Gemfile.lock /rails-chat-tutorial/Gemfile.lock

RUN bundle install 

ADD . /rails-chat-tutorial