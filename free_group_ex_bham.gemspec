# coding: utf-8
# lib = File.expand_path('../lib', __FILE__)
# $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative './lib/free_group_ex_bham/version'

Gem::Specification.new do |spec|
  spec.name          = "free-group-ex-bham"
  spec.version       = FreeGroupExBham::VERSION
  spec.authors       = ["Jennifer Nelson"]
  spec.email         = ["jennifernelson118@gmail.com"]

  spec.summary       = "Free exercise classes in Birmingham, Alabama"
  spec.description   = "Provides a list and details about upcoming free exercise classes in the Birmingham area."
  spec.homepage      = "https://github.com/jennianelson/free-group-ex-bham-cli-app"
  spec.license       = "MIT"
  spec.files         = ["lib/free_group_ex_bham/cli.rb", "lib/free_group_ex_bham/library.rb", "lib/free_group_ex_bham/gardens.rb",        "lib/free_group_ex_bham/rrpark.rb", "lib/free_group_ex_bham/scraper.rb", "config/environment.rb"]
  spec.executables << 'free-group-ex-bham'

  # spec.bindir        = "exe"
  # spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  # spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "pry"
end
