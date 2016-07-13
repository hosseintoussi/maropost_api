# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "maropost_api/version"

Gem::Specification.new do |spec|
  spec.name          = "maropost_api"
  spec.version       = MaropostApi::VERSION
  spec.authors       = ["Hossein Toussi", "Haidar Muhammad"]
  spec.email         = ["saeed.toussi@yahoo.com", "haidar.muhammad@gmail.com"]

  spec.summary       = "Wrapper gem for Maropost API"
  spec.homepage      = "https://github.com/hosseintoussi/maropost_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "pry"

  spec.add_runtime_dependency "httparty"
  spec.add_runtime_dependency "hashie"
end
