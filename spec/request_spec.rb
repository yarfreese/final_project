require 'rspec'
require 'machines'
require 'requests'
require 'users'

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

  it "#get_all should return all requests" do
    subject.get_all.should eq ( [{:req_id=>"24", :user_id=>"267", :date_reqd=>"04-23-2013", :days_reqd=>"10", :num_machines=>"4", :image=>"WIN7", :comments=>"for internal testing"}, {:req_id=>"25", :user_id=>"4", :date_reqd=>"05-01-2013", :days_reqd=>"3", :num_machines=>"1", :image=>"WIN8", :comments=>"have a good weekend"}, {:req_id=>"207", :user_id=>"3", :date_reqd=>"04-15-2013", :days_reqd=>"5", :num_machines=>"2", :image=>"WIN7", :comments=>nil}, {:req_id=>"23", :user_id=>"3", :date_reqd=>"04-15-2013", :days_reqd=>"5", :num_machines=>"2", :image=>"XP", :comments=>"sorry I need so many at once"}] )
  end

  it "#get should return matching request (based on req_id)" do
    subject.get('23').should eq ( {:req_id=>"23", :user_id=>"3", :date_reqd=>"04-15-2013", :days_reqd=>"5", :num_machines=>"2", :image=>"XP", :comments=>"sorry I need so many at once"} )
  end

  it "#get should return nil if no match" do
    subject.get('122').should eq nil
  end

  it "#add creates a new machine record, returns count (5)" do
    subject.add('4', '06-02-2013', 3, 1, 'XP', 'thanks').should eq 5
  end

  it "#add creates a new machine record, request id should be 209 (207+2)" do
    subject.add('3', '06-04-2013', 3, 1, 'WIN8', 'cha cha cha')
    subject.last.should eq ( {:req_id=>"209", :user_id=>"3", :date_reqd=>"06-04-2013", :days_reqd=>"3", :num_machines=>"1", :image=>"WIN8", :comments=>"cha cha cha"} )
  end

  it "#show should display all requests and return a count"  do
    subject.show.should eq 6
  end

  it "#req_date_range should return the range of dates machine(s) required" do
    start_date = Date.strptime('2013-04-15', '%Y-%m-%d')
    end_date = start_date + 5
    subject.req_date_range('207').should eq start_date..end_date
  end

end
