require 'sinatra/base'
require 'erb'

module WorkerTracker
  class Server < Sinatra::Base
    dir = File.dirname(File.expand_path(__FILE__))

    set :views,  "#{dir}/server/views"
    set :public, "#{dir}/server/public"
    set :static, true

    helpers do
      include Rack::Utils

      def path_prefix
        request.env['SCRIPT_NAME']
      end

      def url(*path_parts)
        [ path_prefix, path_parts ].join("/").squeeze('/')
      end
      alias_method :u, :url

    end # helpers

    def show(page, layout = true)
      erb page.to_sym, {:layout => layout}
    end

    get "/" do
      show :index
    end
  end
end