class Requests

  puts "In Requests"

  def initialize
    puts "in initialize"
    puts "filename:  #{RFILE}"
    lines = File.open(RFILE, 'r').readlines
    @entries = lines[0..-1]
    @requests = @entries.collect do |line|
       entry_to_hash line.chomp
    end
  end

  def fields
    [:req_id, :user_id, :date_reqd, :days_reqd, :num_machines, :image, :comments]
  end

  def count
    @requests.count
  end

  def entry_to_hash line
    values = line.split("|")
    Hash[fields.zip values]
  end

  def add user, date, days, num, image, comment
    new_req = {:req_id=>"#{id_next}", :user_id=>"#{user}", :date_reqd=>"#{date}", :days_reqd=>"#{days}", :num_machines=>"#{num}", :image=>"#{image}", :comments=>"#{comment}"}
    @requests.push new_req
    save 
    count
  end

  def save 
    f = File.open(RFILE, "w")
    @requests.collect do |line|
      f.puts "#{line[:req_id]}|#{line[:user_id]}|#{line[:date_reqd]}|#{line[:days_reqd]}|#{line[:num_machines]}|#{line[:image]}|#{line[:comments]}"
    end
    f.close
    count
  end

  def id_next
    last_id = 0
    @requests.collect do |line|
      curr_id = line[:req_id]
      if curr_id.to_i > last_id
        last_id = curr_id.to_i
      end
    end
    last_id+1
  end

  def last
    @requests[-1]
  end

  def show
    puts "req id | user id | date | # days | # machines | image | comments"
    @requests.collect do |line|
      puts "#{line[:req_id]} | #{line[:user_id]} | #{line[:date_reqd]} | #{line[:days_reqd]} | #{line[:num_machines]} | #{line[:image]} | #{line[:comments]}"
      #if !line[:comments].nil?
      #  puts "  comments:  #{line[:comments]}"
      #end
    end 
  end

end
