#$LOAD_PATH.unshift File.dirname(__FILE__)
$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require 'lab_reservation'

# TODO: Below, change the gem name, authors, and email

Gem::Specification.new do |s|
  s.name        = 'tsolak_lab_reservation'
  s.version     = LabReservation::VERSION
  s.date        = '2013-03-09'
  s.summary     = "Reserve a Lab Machine"
  s.description = "A gem to reserve one or more lab machines for one or more days"
  s.authors     = ["Theresa Solak"]
  s.email       = 'yarfreese@gmail.com'
  s.homepage    = 'http://rubygems.org/gems/lab_reservation'
  s.files       = ["lib/lab_reservation.rb", "lib/requests.rb", "lib/lab_reservation/version.rb", "lib/machines.rb"]
  s.executables << 'lab_reservation'
end
