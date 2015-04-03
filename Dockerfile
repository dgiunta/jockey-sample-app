FROM ruby:2.0.0-p643

# Run build against Gemfile first so subsequent builds are much faster
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

# changing of the assets should bust the build cache
ADD app/assets /app/app/assets

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile /app/
COPY Gemfile.lock /app/
RUN bundle install

ADD . /app

CMD ["/start", "web"]
