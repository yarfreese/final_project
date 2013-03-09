require 'rspec'
require 'machines.rb'
require 'requests.rb'
require 'users.rb'

RFILE = 'data/sample_requests.txt'
RFILE_COPY = 'data/sample_requests.copy.for.test.txt'

File.open(RFILE, "w") do |line|
  #req_id|user_id|date_req'd|#days|#machines|image|comments
  line.puts("24|267|04-23-2013|10|4|WIN7|for internal testing")
  line.puts("25|4|05-01-2013|3|1|WIN8|have a good weekend")
  line.puts("207|3|04-15-2013|5|2|WIN7|")
  line.puts("23|3|04-15-2013|5|2|XP|sorry I need so many at once")
end

File.copy_stream(RFILE, RFILE_COPY)

describe Requests do

  subject { Requests.new }

   it "#count should return 4" do
     subject.count.should eq 4
   end

  it "#add creates a new machine record, returns count (5)" do
    subject.add('4', '06-02-2013', 3, 1, 'XP', 'thanks').should eq 5
  end

  it "#add creates a new machine record, request id should be 209 (207+2)" do
    subject.add('3', '06-04-2013', 3, 1, 'WIN8', 'cha cha cha')
    subject.last.should eq ( {:req_id=>"209", :user_id=>"3", :date_reqd=>"06-04-2013", :days_reqd=>"3", :num_machines=>"1", :image=>"WIN8", :comments=>"cha cha cha"} )
  end

  it "#show should display all requests" 

end
