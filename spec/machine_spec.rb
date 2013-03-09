require 'rspec'
require 'machines.rb'
require 'requests.rb'
require 'users.rb'

MFILE = 'data/sample_machines.txt'
MFILE_COPY = 'data/sample_machines.copy.for.test.txt'

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

end
