class WorkerList
  def self.clear_workers
    @workers = []
  end

  clear_workers

  def self.find
    @workers
  end

  def self.add_worker( worker_hash )
    unless @workers.include?( worker_hash )
      @workers << worker_hash
    end
  end

  def self.mark_worker_as_busy( worker_ip )
    worker = @workers.detect{|w| w[:host] == worker_ip }
    worker[:status] = "busy" # unless worker.empty?
    worker.to_json
  end
end