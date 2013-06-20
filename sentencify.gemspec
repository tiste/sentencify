# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sentencify/version'

Gem::Specification.new do |spec|
  spec.name          = 'sentencify'
  spec.version       = Sentencify::VERSION
  spec.authors       = ['Baptiste Lecocq']
  spec.email         = ['baptiste.lecocq@gmail.com']
  spec.description   = 'Create sentences with array of Active Record objects'
  spec.summary       = 'Create sentences with array of Active Record objects'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
