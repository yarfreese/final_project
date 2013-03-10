require 'date'

class Machines

  puts "In Machines"

  def initialize
    #puts  "in initialize"
    #puts "#{MFILE}"
    lines = File.open(MFILE, 'r').readlines
    @entries = lines[0..-1]
    @machines = @entries.collect do |line|
      entry_to_hash line.chomp
    end
    count
  end

  def fields
    [:mach_id, :req_id]
  end

  def entry_to_hash line
    values = line.split("|")
    Hash[fields.zip values]
  end

  def count
    @machines.count
  end

  def add id
    f = File.open(MFILE, "a")
    @machines.collect do |line|
      if (id == line[:mach_id]) 
        puts "machine already exists, not added"
        break
      end
    end
    f.write "#{id}|"
    f.close
    initialize
    # @machines.push "#{id}|"
  end
 
  def save
    f = File.open(MFILE, "w")
    @machines.collect do |line|
      f.puts "#{line[:mach_id]}|#{line[:req_id]}"
    end
    f.close
  end

  def show
    puts @machines
    count 
  end 

  def find_free date, days
    desired_range = Date.strptime(date, '%m-%d-%Y')..(Date.strptime(date, '%m-%d-%Y') + days.to_i)
    # puts "desired_range: #{desired_range}"
    free_machines = Array.new
    @machines.collect do |line|
      # puts line
      if line[:req_id].nil? 
        free_machines.push line[:mach_id]  
      else
        avail = true
        r = line[:req_id].split(", ")
        # puts "r: #{r}"
        # account for multiple requests being fulfilled by a given machine
        r.collect do |rq|
          # puts "rq: #{rq}"
          rq_range = Requests.new.req_date_range rq
          # puts "rq_range: #{rq_range}"
          rq_range.map do |date| 
            if desired_range === date
              avail = false 
            end
          end
          # puts "avail: #{avail}"
        end
        if avail == true
          free_machines.push line[:mach_id]  
        end
      end
    end
    free_machines
  end
       
end
