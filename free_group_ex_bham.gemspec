# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative './lib/free_group_ex_bham/version'

Gem::Specification.new do |spec|
  spec.name          = "free-group-ex-bham"
  spec.version       = FreeGroupExBham::VERSION
  spec.date          = '2017-09-12'
  spec.authors       = ["Jennifer Nelson"]
  spec.email         = ["jennifernelson118@gmail.com"]

  spec.summary       = "Free exercise classes in Birmingham, Alabama"
  spec.description   = "Provides a list and details about upcoming free exercise classes in the Birmingham area."
  spec.homepage      = 'https://github.com/jennianelson/free-group-ex-bham-cli-app'
  spec.license       = "MIT"
  spec.files         = ["lib/free_group_ex_bham/cli.rb", "lib/free_group_ex_bham/library.rb", "lib/free_group_ex_bham/gardens.rb",        "lib/free_group_ex_bham/rrpark.rb", "lib/free_group_ex_bham/scraper.rb", "config/environment.rb"]
  spec.executables   = ['free-group-ex-bham']

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "pry"
end
