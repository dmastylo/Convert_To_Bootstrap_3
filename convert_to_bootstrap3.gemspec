# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'convert_to_bootstrap3/version'

Gem::Specification.new do |spec|
  spec.name          = 'convert_to_bootstrap3'
  spec.version       = ConvertToBootstrap3::VERSION
  spec.authors       = ['Damian Mastylo']
  spec.email         = ['dmastylo@codequarry.net']
  spec.summary       = %q{ A gem to convert all markup in .html and .html.erb files in a folder from Bootstrap 2 into Bootstrap 3 markup. }
  spec.description   = %q{ A gem to convert all markup in .html and .html.erb files in a folder from Bootstrap 2 into Bootstrap 3 markup. }
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['convert_to_bootstrap3']
  # spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # Runtime dependency
  spec.add_runtime_dependency 'capybara', '>= 0'
  spec.add_runtime_dependency 'poltergeist'

  # Development Dependencies
  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
