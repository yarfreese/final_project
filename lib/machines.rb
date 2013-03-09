class Machines

  puts "In Machines"

  def initialize
    puts  "in initialize"
    puts "#{MFILE}"
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
    puts 'in add'
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
    free_machines = Array.new
    reqs = Requests.new
    puts reqs
    @machines.collect do |line|
      puts line
      if line[:req_id].nil? 
        free_machines.push line[:mach_id]  
      else
      ### dates need work ###
      end
    end
    free_machines
  end
       
end
