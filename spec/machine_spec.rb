$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require 'rspec'
require 'machines'
require 'requests'
require 'users'

MFILE = 'data/sample_machines.txt'
MFILE_COPY = 'data/sample_machines.copy.for.test.txt'
RFILE = 'data/sample_requests.txt'

File.open(MFILE, "w") do |line|
  line.puts("q123456|23")
  line.puts("q234567|207")
  line.puts("q345678|23, 25")
  line.puts("q987899|25")
  line.puts("q456789|")
end

File.copy_stream(MFILE, MFILE_COPY)

describe Machines do

  subject { Machines.new }

  it "#add creates a new machine record" do
    subject.add('q876543')
    subject.count.should eq 6
  end

  it "#show displays the records and returns a count" do
    subject.show.should eq 6
  end

  it "#find_free returns available machine" do
    subject.find_free('04-15-2013', 2).should eq ( ["q987899", "q456789", "q876543"] )
  end

  it "#add_req adds request id to machine record without one" do
    subject.add_req("q456789", "207").should eq ( {:mach_id=>"q456789", :req_id=>"207"} ) 
  end
 
  it "#add_req appends request id to machine record that already has one (or more)" do
    subject.add_req("q345678", "207").should eq ( {:mach_id=>"q345678", :req_id=>"23, 25, 207"} ) 
  end
 
  it "#get returns hash for given machine id" do
    subject.get('q456789').should eq ( {:mach_id=>"q456789", :req_id=>"207"} )
  end

end
