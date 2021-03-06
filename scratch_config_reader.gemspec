# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scratch_config_reader/version'

Gem::Specification.new do |spec|
  spec.name          = "scratch_config_reader"
  spec.version       = ScratchConfigReader::VERSION
  spec.authors       = ["Marc Leglise"]
  spec.email         = ["mleglise@gmail.com"]
  spec.summary       = %q{Practice work. Not for production use.}
  spec.description   = %q{Practice work. Not for production use.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
