class Users

#  FILENAME="data/sample.txt"

  def initialize 
    lines = File.open(UFILE, 'r').readlines
    @entries = lines[0..-1]
    @usrs = @entries.collect do |line|
      entry_to_hash line
    end
  end

  def fields
    [:last_name, :first_name, :admin, :id]
  end

  def entry_to_hash line
    values = line.split("|")
    Hash[fields.zip values]
  end

  def add l_name, f_name
    f = File.open(UFILE, "a")
    @usrs.collect do |line|
      if (l_name == line[:last_name]) && (f_name == line[:first_name])
        puts "User already exists, not added"
        break
      end
    end
    id_next = id_last + 1
    f.puts "#{l_name}|#{f_name}|false|#{id_next}"
    f.close
    initialize
  end

  def del l_name, f_name 
    f = File.open(UFILE, "w")
    @usrs.collect do |line|
      if (l_name == line[:last_name]) && (f_name == line[:first_name])
        loop
      else
        f.puts "#{line[:last_name]}|#{line[:first_name]}|#{line[:admin]}|#{line[:id]}"
      end
    end
    f.close
    initialize
  end

  def id_last
    last = 0
    @entries.collect do |line|
      last_name, first_name, admin, id = line.split("|")
      if id.to_i > last
        last = id.to_i
      end
    end
    last
  end

  def write_new filename
    f = File.open(filename, "w")
    @entries.collect do |line|
      f.puts line
    end
    f.close
  end

  def is_admin l_name, f_name
    ans = false
    @entries.collect do |line|
      last_name, first_name, admin, id = line.split("|")
      if (l_name == last_name) && (f_name == first_name)
        if admin == "true"
          ans = true
        end
      end
    end
    ans
  end
  
  def user_exists l_name, f_name
    ans = false
    @usrs.collect do |line|
      if (l_name == line[:last_name]) && (f_name == line[:first_name])
        ans = true
      end
    end
    ans
  end

 # def user_exists l_name, f_name
 #   ans = false
 #   @entries.collect do |line|
 #     last_name, first_name, admin, id = line.split("|")
 #     if (l_name == last_name) && (f_name == first_name)
 #       ans = true
 #     end
 #   end
 #   ans
 # end

  def name_update old_l_name, f_name, new_l_name
    @usrs.collect do |line|
      if (old_l_name == line[:last_name]) && (f_name == line[:first_name])
        line[:last_name] = new_l_name
      end
    end
 #   @entries.collect do |line|
 #     last_name, first_name, admin, id = line.split("|")
 #     if (old_l_name == last_name) && (f_name == first_name)
 #       line = "#{new_l_name}|{first_name}"
 #     end
 #   end
 #   puts @usrs
    save
  end
 
  def save 
    f = File.open(UFILE, "w")
    @usrs.collect do |line|
      f.puts "#{line[:last_name]}|#{line[:first_name]}|#{line[:admin]}|#{line[:id]}"
    end
    f.close
  end

       
end
