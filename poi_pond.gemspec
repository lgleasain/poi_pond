# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{poi_pond}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Lance Gleason"]
  s.date = %q{2011-04-10}
  s.description = %q{This gem wraps the }
  s.email = %q{lgleasain@yahoo.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "javalibs/poi-3.7-20101029.jar",
    "javalibs/poi-examples-3.7-20101029.jar",
    "javalibs/poi-ooxml-3.7-20101029.jar",
    "javalibs/poi-ooxml-schemas-3.7-20101029.jar",
    "javalibs/poi-scratchpad-3.7-20101029.jar",
    "lib/poi_pond.rb",
    "lib/style.rb",
    "test/helper.rb",
    "test/image001.jpg",
    "test/test_poi_pond.rb",
    "test/test_style.rb"
  ]
  s.homepage = %q{http://github.com/lgleasain/poi_pond}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A gem to user POI in a native (non-jruby) environment}
  s.test_files = [
    "test/helper.rb",
    "test/test_poi_pond.rb",
    "test/test_style.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rjb>, ["= 1.3.2"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<rjb>, ["= 1.3.2"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<rjb>, ["= 1.3.2"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

