# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rjb}
  s.version = "1.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["arton"]
  s.date = %q{2010-10-30}
  s.description = %q{RJB is a bridge program that connect between Ruby and Java with Java Native Interface.
}
  s.email = %q{artonx@gmail.com}
  s.extensions = ["ext/extconf.rb"]
  s.files = ["ext/RBridge.java", "ext/load.c", "ext/rjbexception.c", "ext/riconv.c", "ext/rjb.c", "ext/jp_co_infoseek_hp_arton_rjb_RBridge.h", "ext/riconv.h", "ext/extconf.h", "ext/jniwrap.h", "ext/rjb.h", "ext/depend", "data/rjb/jp/co/infoseek/hp/arton/rjb/RBridge.class", "lib/rjb.rb", "lib/rjbextension.rb", "samples/filechooser.rb", "test/test.rb", "test/exttest.rb", "test/gctest.rb", "test/jp/co/infoseek/hp/arton/rjb/Base.class", "test/jp/co/infoseek/hp/arton/rjb/IBase.class", "test/jp/co/infoseek/hp/arton/rjb/Test.class", "test/jp/co/infoseek/hp/arton/rjb/Test$TestTypes.class", "test/jp/co/infoseek/hp/arton/rjb/ExtBase.class", "test/rjbtest.jar", "test/jartest.jar", "COPYING", "ChangeLog", "readme.sj", "readme.txt", "ext/extconf.rb"]
  s.homepage = %q{http://rjb.rubyforge.org/}
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.2")
  s.requirements = ["none", "JDK 5.0"]
  s.rubyforge_project = %q{rjb}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Ruby Java bridge}
  s.test_files = ["test/test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
