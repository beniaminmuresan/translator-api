FROM ruby:latest

WORKDIR /usr/src/api

COPY Gemfile /usr/src/api/Gemfile
COPY Gemfile.lock /usr/src/api/Gemfile.lock

RUN bundle install

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]