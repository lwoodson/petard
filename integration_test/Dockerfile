FROM ruby:2.2.3

# Install integration test suite
RUN mkdir -p /qa
COPY Gemfile /qa/Gemfile
COPY test.rspec /qa/test.rspec
WORKDIR /qa
RUN bundle install

# Install waitforservices
RUN curl --location --silent --show-error --fail \
    https://github.com/Barzahlen/waitforservices/releases/download/v0.2/waitforservices \
    > /usr/local/bin/waitforservices && \
    chmod +x /usr/local/bin/waitforservices

# Install docker so we can kill everything when done
RUN curl --location --silent --show-error --fail \
    https://get.docker.com/builds/Linux/x86_64/docker-latest \
    > /usr/local/bin/docker && \
    chmod +x /usr/local/bin/docker

# Install runner app
COPY runner.sh /app/runner.sh
RUN chmod +x /app/runner.sh

CMD ["/app/runner.sh"]
