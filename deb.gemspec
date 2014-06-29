require 'date'
require File.join(File.dirname(__FILE__), "lib", "deb.rb")

Gem::Specification.new do |s|
  s.name        = 'deb'
  s.version     = 0.1
  s.date        = Date.today.to_s
  s.summary     = "Deb package manipulator"
  s.description = "Deb package manipulation"
  s.authors     = [ "Nicolas Szalay" ]
  s.email       = [ "nico@rottenbytes.info" ]
  s.files       = %w[
                    README.md
                    lib/deb.rb
                  ]
  s.homepage    = "https://github.com/rottenbytes/ruby-deb"
  s.add_dependency "ar", ">= 0.1"
end
