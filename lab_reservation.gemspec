$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require 'lab_reservation'

# TODO: Below, change the gem name, authors, and email

Gem::Specification.new do |s|
  s.name        = 'tsolak_lab_reservation'
  s.version     = TestGem::VERSION
  s.date        = '2013-03-09'
  s.summary     = "Reserve a Lab Machine"
  s.description = "A gem to reserve one or more lab machines for one or more days"
  s.authors     = ["Theresa Solak"]
  s.email       = 'yarfreese@gmail.com'
  s.homepage    = 'http://rubygems.org/gems/'
  s.files       = ["lib/test_gem.rb", "lib/test_gem/version.rb", "lib/test_gem/hello.rb", "lib/test_gem/my_file.rb"]
  s.executables << 'test_gem'
end
