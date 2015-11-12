require 'sinatra'
require 'faraday'

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
    hello = make_request_to hello_endpoint, "/hello"
    world = make_request_to world_endpoint, "/world"
    "#{hello} #{world}"
  end

  def make_request_to(endpoint, path)
    response = endpoint.get(path).tap { |response| raise "error" unless response.success? }
    response.body
  end

  def hello_endpoint
    @hello_endpoint ||= Faraday.new(url: "http://#{@hello_host}:#{@hello_port}")
  end

  def world_endpoint
    @world_endpoint ||= Faraday.new(url: "http://#{@world_host}:#{@world_port}")
  end
end

service = HelloWorldService.new

get '/helloworld' do
  service.invoke
end
