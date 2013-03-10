require 'rspec'
require 'machines.rb'
require 'requests.rb'
require 'users.rb'

MAX_ID = 267  # Highest user id in sample file is 267

UFILE="data/sample.txt"

describe Users do

  subject { Users.new }

  it '#id_last returns highest numbered id' do
    expected = MAX_ID 
    actual = subject.id_last
    actual.should eq expected
  end

  it '#write_new writes to new file' do
    fn = 'data/sample2.for.test.txt'
    if File.exists?(fn)
      File.delete(fn)
    end
    subject.write_new fn 
    File.exists?(fn).should == true
  end

  it '#is_admin returns true for admin user' do
    expected = true
    actual = subject.is_admin 'Solak', 'Theresa'
    actual.should eq expected
  end

  it '#is_admin returns false for other users' do
    expected = false
    actual = subject.is_admin 'Jones', 'Bob'
    actual.should eq expected
  end

  # next 5 go together - test for user, change user, test for user, change user back, test for user
  it '#user_exists returns true if user exists' do
    expected = true
    actual = subject.user_exists 'Smith', 'Jean'
    actual.should eq expected
  end

  it '#name_update Smith to Mitchell-Smith' do
    subject.name_update 'Smith', 'Jean', 'Mitchell-Smith'
  end

  it '#user_exists returns false if user NOF' do
    expected = false
    actual = subject.user_exists 'Smith', 'Jean'
    actual.should eq expected
  end

  # put old name back
  it '#name_update Mitchell-Smith back to Smith' do
    subject.name_update 'Mitchell-Smith', 'Jean', 'Smith'
  end

  it '#user_exists returns true if user exists' do
    expected = true
    actual = subject.user_exists 'Smith', 'Jean'
    actual.should eq expected
  end
  # previous 5 go together - test for user, change user, test for user, change user back, test for user

  ## next 3 go together - test for user, add user, test for user, remove user, test for user
  it '#user_exists check if Chris Green exists -- expect false' do
    expected = false
    actual = subject.user_exists 'Green', 'Chris'
    actual.should eq expected
  end

  it '#add Chris Green and check again -- expect true' do
    subject.add 'Green', 'Chris'
    expected = true
    actual = subject.user_exists 'Green', 'Chris'
    actual.should eq expected
  end

  it '#del -- remove Chris Green and check again -- expect false' do
    subject.del 'Green', 'Chris'
    expected = false
    actual = subject.user_exists 'Green', 'Chris'
    actual.should eq expected
  end
  ## previous 3 go together - test for user, add user, test for user, remove user, test for user


  ### next 3 go together - test for user, add user, test for user, remove user, test for user
  it '#user_exists check if Chris Green exists -- expect false' do
    expected = false
    actual = subject.user_exists 'Green', 'Chris'
    actual.should eq expected
  end

  it '#add Chris Green and check if id is incremented appropriately' do
    subject.add 'Green', 'Chris'
    expected = MAX_ID+1 
    actual = subject.id_last 
    actual.should eq expected
  end

  it '#del -- remove Chris Green and check again -- expect false' do
    subject.del 'Green', 'Chris'
    expected = false
    actual = subject.user_exists 'Green', 'Chris'
    actual.should eq expected
  end
  ### previous 3 go together - test for user, add user, test for user, remove user, test for user

end
