# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "agery/version"

Gem::Specification.new do |s|
  s.name        = "agery"
  s.version     = Agery::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Chris Griego"]
  s.email       = ["cgriego@gmail.com"]
  s.homepage    = "https://github.com/cgriego/agery"
  s.summary     = %q{Integer extensions for generating arrays of ages.}
  s.description = %q{Integer extensions for generating arrays of ages.}

  s.rubyforge_project = "agery"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler"
end
