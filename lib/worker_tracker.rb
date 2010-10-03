require "bundler/setup"
Bundler.require(:default)

require 'worker_tracker/worker_list'

module WorkerTracker
  VERSION = File.read(File.join(File.dirname(__FILE__), "..","VERSION"))
end