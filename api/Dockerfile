FROM ruby:2.2.3

# Install app
RUN mkdir -p /app
COPY Gemfile /app/Gemfile
COPY app.rb /app/app.rb
WORKDIR /app
RUN bundle install

# Install waitforservices
RUN curl --location --silent --show-error --fail \
    https://github.com/Barzahlen/waitforservices/releases/download/v0.2/waitforservices \
    > /usr/local/bin/waitforservices && \
    chmod +x /usr/local/bin/waitforservices

# Install runner app
COPY runner.sh /app/runner.sh
RUN chmod +x /app/runner.sh

CMD ["/app/runner.sh"]
