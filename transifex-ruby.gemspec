# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'transifex/version'

Gem::Specification.new do |s|
  s.version       = Transifex::VERSION
  s.name          = 'transifex-ruby'
  s.license       = 'MIT'
  s.homepage      = 'http://github.com/tmaesaka/transifex-ruby'
  s.summary       = 'Ruby client library for Transifex API'
  s.description   = s.summary

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']
  s.authors       = ['Toru Maesaka']
  s.email         = ['toru@tmaesaka.com']

  s.add_dependency 'faraday', '~> 0.8.0'
  s.add_dependency 'faraday_middleware', '~> 0.9.0'
  s.add_dependency 'hashie', '~> 1.2.0'

  s.add_development_dependency 'bundler', '~> 1.3'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'pry'
end
