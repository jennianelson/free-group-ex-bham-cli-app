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
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"
  spec.files         = ["lib/free_group_ex_bham/cli.rb", "lib/free_group_ex_bham/offerings.rb" "config/environment.rb"]
  spec.executables << 'free-group-ex-bham'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end
  #
  # spec.files         = `git ls-files -z`.split("\x0").reject do |f|
  #   f.match(%r{^(test|spec|features)/})
  # end
  # spec.bindir        = "exe"
  # spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  # spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
end
