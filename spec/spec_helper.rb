require "bundler/setup"
Bundler.require(:test)


require 'spec'

# i thought rspec put the lib dir on the path. *scratches head*
$LOAD_PATH.unshift ::File.expand_path(::File.dirname(__FILE__) + '/../lib')

require 'worker_tracker'
