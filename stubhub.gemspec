# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stubhub/version'

Gem::Specification.new do |gem|
  gem.name          = "stubhub"
  gem.version       = Stubhub::VERSION
  gem.authors       = ["Ryan Loomba"]
  gem.email         = ["ryan.loomba@gmail.com"]
  gem.description   = %q{A Ruby gem for accessing the stubhub api}
  gem.summary       = %q{A Ruby gem for accessing the stubhub api}
  gem.homepage      = "http://github.com/rloomba/stubhub"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency 'httparty'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'vcr'
  gem.add_development_dependency 'webmock'
end
