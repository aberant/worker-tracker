class WorkerList
  def self.find
    [
      {:host => "127.0.0.1", :status => "available"},
      {:host => "1.1.1.1", :status => "available"},
      {:host => "2.2.2.2", :status => "available"}
    ]
  end
end