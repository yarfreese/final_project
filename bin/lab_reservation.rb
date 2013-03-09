#!/usr/bin/env ruby

require "../lib/requests.rb"

FILE = "../data/sample_requests.copy.for.test.txt"

#if !Dir.exists(../data)
   ### need stuff here
#end
#if !File.exists(FILE)
   ### need stuff here
#end

puts " Options "
puts "   a - add request"
puts "   s - show existing requests"
puts "   q - quit"
opt = gets.chomp

while opt != "q" do

    case 
    when opt == "a"
      puts " date required (mm-dd-yyyy)?"
      req_date = gets.chomp
      puts " number of days needed?"
      num_days = gets.chomp
      puts " number of machines needed?"
      num_mach = gets.chomp
      puts " image (XP|Win7|Win8)?"
      img = gets.chomp
      puts " comments (optional)?"
      comment = gets.chomp
      Requests.new.add('1', req_date, num_days, num_mach, img, comment) 
    when opt == "s"
      Requests.new.show
    else
      puts "Invalid Option, please try again"
    end

    puts " Options"
    puts "   a - add request"
    puts "   s - show existing requests"
    puts "   u - update request"
    puts "   q - quit"
    opt = gets.chomp

end
