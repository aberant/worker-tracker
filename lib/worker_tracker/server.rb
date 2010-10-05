require 'sinatra/base'
require 'erb'
require 'worker_tracker'

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
      @workers = WorkerList.find
      show :index
    end

    post "/register_worker" do
      worker_data = JSON.parse(params[:worker_data])
      worker_hash = {:host => worker_data["host"], :status => worker_data["status"]}

      WorkerList.add_worker( worker_hash )

      redirect "/"
    end

    post "/mark_as_busy" do
      worker_data = JSON.parse(params[:worker_data])
      host_ip = worker_data["host"]

      WorkerList.mark_worker_as_busy( host_ip )

      redirect "/"
    end

    post "/mark_as_available" do
      worker_data = JSON.parse(params[:worker_data])
      host_ip = worker_data["host"]

      WorkerList.mark_worker_as_available( host_ip )

      redirect "/"
    end
  end
end