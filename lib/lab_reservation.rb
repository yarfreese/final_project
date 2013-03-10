#$LOAD_PATH.unshift File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path("../lab_reservation", __FILE__)

require 'version'
require 'yaml'

module LabReservation

  puts "module LabReservation defined"

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
