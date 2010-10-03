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
end