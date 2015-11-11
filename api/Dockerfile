FROM ruby:2.2.3

RUN mkdir -p /app
COPY Gemfile /app/Gemfile
COPY app.rb /app/app.rb
WORKDIR /app
RUN bundle install

CMD ["ruby", "/app/app.rb"]
