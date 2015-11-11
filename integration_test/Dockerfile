FROM ruby:2.2.3

RUN mkdir -p /qa
COPY Gemfile /qa/Gemfile
COPY test.rspec /qa/test.rspec
WORKDIR /qa
RUN bundle install

CMD ["rspec", "/qa/test.rspec"]
