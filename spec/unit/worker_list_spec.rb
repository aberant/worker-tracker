require File.join( File.dirname(__FILE__) , '..', 'spec_helper' )

describe WorkerList do
  before :each do
    WorkerList.clear_workers
  end

  it "adds workers" do
    lambda{
      WorkerList.add_worker(:host => "127.0.0.1", :status => "available")
    }.should change(WorkerList.find, :size).by(1)
  end

  it "doesn't add dupe workers with the same host ip" do
    lambda{
      WorkerList.add_worker(:host => "127.0.0.1", :status => "available")
      WorkerList.add_worker(:host => "127.0.0.1", :status => "available")
    }.should change(WorkerList.find, :size).by(1)
  end

  it "marks a worker as busy" do
    WorkerList.add_worker(:host => "127.0.0.1", :status => "available")
    WorkerList.mark_worker_as_busy( "127.0.0.1")[:status].should == "busy"
  end
end