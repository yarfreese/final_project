class Options

  def initialize
    puts "in initialize"
    display_options
  end

  def echo
    print "enter something: "
    response = gets.chomp
    puts "#{response}"
  end

  def display_options
    puts "  Enter Option "
    puts "    r - enter new request"
    puts "    d - display existing requests"
    puts "    u - update request"
  end

end
