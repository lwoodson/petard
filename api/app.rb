require 'sinatra'
require 'httparty'

set :bind, "0.0.0.0"
set :port, 10000

class HelloWorldService
  def initialize
    @hello_host = ENV['HELLO_HOST'] || 'localhost'
    @hello_port = ENV['HELLO_PORT'] || 10001
    @world_host = ENV['WORLD_HOST'] || 'localhost'
    @world_port = ENV['WORLD_PORT'] || 10002
  end

  def invoke
    hello = make_request_to hello_endpoint
    world = make_request_to world_endpoint
    "#{hello} #{world}"
  end

  def make_request_to(endpoint)
    HTTParty.get(endpoint).tap do |response|
      raise "Bad response" if response.code != 200
      response.body
    end
  end

  def hello_endpoint
    "http://#{@hello_host}:#{@hello_port}/hello"
  end

  def world_endpoint
    "http://#{@world_host}:#{@world_port}/world"
  end
end

service = HelloWorldService.new

get '/helloworld' do
  service.invoke
end
