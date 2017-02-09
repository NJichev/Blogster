# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'blogster/version'

Gem::Specification.new do |spec|
  spec.name          = "blogster"
  spec.version       = Blogster::VERSION
  spec.authors       = ["Nikola Jichev"]
  spec.email         = ["njichev@gmail.com"]

  spec.summary       = %q{Simple static site generator.}
  spec.description   = %q{You can create static blogs with this gem.}
  spec.homepage      = "https://github.com/njichev/blogster"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://github.com/njichev/blogster"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "sinatra", "~> 1.4"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "pry-doc", "~> 0.10"
  spec.add_development_dependency "rdiscount", "~> 2.2"
end
