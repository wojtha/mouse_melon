# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mouse_melon/version'

Gem::Specification.new do |spec|
  spec.name          = "mouse_melon"
  spec.version       = MouseMelon::VERSION
  spec.authors       = ["Vojtech Kusy"]
  spec.email         = ["wojtha@gmail.com"]

  spec.summary       = "mouse_melon-#{MouseMelon::VERSION}"
  spec.description   = "MouseMelon is a simple DSL which allows to write acceptance specs in Gherkin-like language without any parser."
  spec.homepage      = "http://github.com/wojtha/mouse_melon"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
