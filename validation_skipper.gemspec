# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'validation_skipper/version'

Gem::Specification.new do |gem|
  gem.name          = "validation_skipper"
  gem.version       = ValidationSkipper::VERSION
  gem.authors       = ["Nathan Pearson"]
  gem.email         = ["npearson72@gmail.com"]
  gem.description   = %q{If you need a way to easily skip validations on some attributes and only in certain cases, this gem will allow you to do it in a clean and elegant way.}
  gem.summary       = %q{Easily skip validations in Rails}
  gem.homepage      = "https://github.com/npearson72/validation_skipper"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
