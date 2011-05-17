# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{syslog-sd}
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Alexey Palazhchenko}, %q{Lennart Koopmann}]
  s.date = %q{2011-05-17}
  s.description = %q{Super-Duper library to send syslog messages to logging server such as Graylog2. Supports Structured Data elements as defined by RFC 5424.}
  s.email = %q{alexey.palazhchenko@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    "CHANGELOG",
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "benchmarks/notifier.rb",
    "lib/syslog-sd.rb",
    "lib/syslog-sd/logger.rb",
    "lib/syslog-sd/notifier.rb",
    "lib/syslog-sd/ruby_sender.rb",
    "lib/syslog-sd/severity.rb",
    "syslog-sd.gemspec",
    "test/helper.rb",
    "test/test_logger.rb",
    "test/test_notifier.rb",
    "test/test_ruby_sender.rb",
    "test/test_severity.rb"
  ]
  s.homepage = %q{http://github.com/AlekSi/syslog-sd-rb}
  s.require_paths = [%q{lib}]
  s.rubygems_version = %q{1.8.2}
  s.summary = %q{Library to send syslog messages to logging server such as Graylog2. Supports Structured Data elements as defined by RFC 5424.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<timecop>, [">= 0"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<timecop>, [">= 0"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<timecop>, [">= 0"])
  end
end

