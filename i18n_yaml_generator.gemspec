# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "i18n_yaml_generator/version"

Gem::Specification.new do |s|
  s.name        = "i18n_yaml_generator"
  s.version     = I18nYamlGenerator::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Trym Skaar"]
  s.email       = ["ts@skalar.no"]
  s.homepage    = ""
  s.summary     = %q{Nuff said}
  s.description = %q{Generates i18n yaml locale files for models and resources/views}

  s.rubyforge_project = "i18n-yaml-generator"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
