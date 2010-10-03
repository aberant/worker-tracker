require 'sinatra/base'
require 'erb'

module WorkerTracker
  class Server < Sinatra::Base
    dir = File.dirname(File.expand_path(__FILE__))
  end
end