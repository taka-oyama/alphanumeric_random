$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "alphanumeric_random/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name          = "alphanumeric_random"
  s.version       = AlphanumericRandom::VERSION
  s.authors       = ["Taka Oyama"]
  s.email         = ["toyama4649@hotmail.com"]
  s.homepage      = "http://taka.hatenadiary.com"
  s.summary       = "Generates random alphanumeric string."
  s.description   = "AlphanumericRandom class can generate various types of random alphanumeric strings."
  s.license       = "MIT"
  s.files         = Dir["lib/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.require_paths = ["lib"]
end
