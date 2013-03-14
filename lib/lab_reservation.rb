#$LOAD_PATH.unshift File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path("../lab_reservation", __FILE__)

DATADIR = "#{Dir.home}/lr_data"

MFILE = "#{DATADIR}/machines.txt"
RFILE = "#{DATADIR}/requests.txt"
UFILE = "#{DATADIR}/users.txt"

require 'version'
require 'yaml'
require 'users'
require 'requests'
require 'machines'

module LabReservation

  puts "module LabReservation defined"

  def self.sample_files 

    if !Dir.exists?(DATADIR)
      Dir.mkdir(DATADIR)
    end

    if !File.exists?(MFILE)
      File.open(MFILE, "w") do |line|
        line.puts("q123456|23")
        line.puts("q234567|207")
        line.puts("q345678|23, 25")
        line.puts("q987899|25")
        line.puts("q456789|")
      end
    end

    if !File.exists?(RFILE)
      File.open(RFILE, "w") do |line|
        #req_id|user_id|date_req'd|#days|#machines|image|comments
        line.puts("24|267|04-23-2013|10|4|WIN7|for internal testing")
        line.puts("25|4|05-01-2013|3|1|WIN8|have a good weekend")
        line.puts("207|3|04-15-2013|5|2|WIN7|")
        line.puts("23|3|04-15-2013|5|2|XP|sorry I need so many at once")
      end
    end

    if !File.exists?(UFILE)
      File.open(UFILE, "w") do |line|
        line.puts("Solak|Theresa|true|1")
        line.puts("Jones|Bob|false|267")
        line.puts("Smith|Jean|false|4")
        line.puts("Doe|John|false|3")
      end
    end

  end

  class MyError < StandardError
  end

  def self.init_config 
    puts "in self.init_config"
    config_values = { :default_file_name => 'default_file.txt', :supported_types => ['txt', 'pdf'] }
    File.open('config.yaml', 'w') do |config| 
      config.write config_values.to_yaml
    end 
  end

  def self.configure
    begin
      if File.exists?('config.yaml')
        puts "exists"
      else
        raise LabReservation::MyError, 'missing config file'
      end
    rescue LabReservation::MyError 
      puts "doesn't exist, but rescued"
      self.init_config
    end
    puts "this prints in any event"
    puts File.read("config.yaml")  
  end

end
