# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'validation_skipper/version'

Gem::Specification.new do |s|
  s.name          = 'validation_skipper'
  s.version       = ValidationSkipper::VERSION
  s.authors       = ['Nathan Pearson', 'Karl Wilbur']
  s.email         = ['npearson72@gmail.com', 'karl@kandrsoftware.com']
  s.description   = %q{If you need a way to easily skip validations on some attributes and only in certain cases, this gem will allow you to do it in a clean and elegant way.}
  s.summary       = %q{Easily skip validations in Rails}
  s.homepage      = 'https://github.com/K-and-R/validation_skipper'

  s.files         = `git ls-files`.split($/)
  s.test_files    = `git ls-files -- spec/*`.split('\n')

  s.require_paths = ['lib']

  s.add_development_dependency 'rake'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'codeclimate-test-reporter'
  s.add_development_dependency 'simplecov'

  s.add_runtime_dependency 'activerecord'
end
