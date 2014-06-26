# -*- encoding: utf-8 -*-
# stub: highlight_js-rails4 7.4.0.4 ruby lib

Gem::Specification.new do |s|
  s.name = "highlight_js-rails4"
  s.version = "7.4.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Rei\nMorphemass"]
  s.date = "2013-11-05"
  s.description = "Rails pipeline wraper for highlight.js"
  s.email = ["morphemass@gmail.com"]
  s.homepage = "https://github.com/os6sense/highlight_js-rails4"
  s.rubygems_version = "2.2.2"
  s.summary = "Rails pipeline wraper for highlight.js"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 4.0.0"])
    else
      s.add_dependency(%q<rails>, [">= 4.0.0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 4.0.0"])
  end
end
