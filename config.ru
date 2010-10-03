$LOAD_PATH.unshift ::File.expand_path(::File.dirname(__FILE__) + '/lib')

require 'worker_tracker/server'

run WorkerTracker::Server.new
