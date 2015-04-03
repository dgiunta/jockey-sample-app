FROM belly/buildstep
# Run build against Gemfile first so subsequent builds are much faster
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

# changing of the assets should bust the build cache
ADD app/assets /app/app/assets

RUN /build/builder
ADD . /app
WORKDIR /app
CMD ["/start", "web"]
