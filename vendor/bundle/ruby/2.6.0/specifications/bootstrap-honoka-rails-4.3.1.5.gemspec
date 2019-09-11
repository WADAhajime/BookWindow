# -*- encoding: utf-8 -*-
# stub: bootstrap-honoka-rails 4.3.1.5 ruby lib

Gem::Specification.new do |s|
  s.name = "bootstrap-honoka-rails".freeze
  s.version = "4.3.1.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Takmg".freeze]
  s.date = "2019-05-30"
  s.description = "Gem to handle -Bootstrap Honoka, Umi, Nico, Rin- easily".freeze
  s.email = ["Takmg@example.com".freeze]
  s.homepage = "https://github.com/Takmg/bootstrap-honoka-rails".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Gem to handle -Bootstrap Honoka, Umi, Nico, Rin- easily".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bootstrap>.freeze, ["~> 4.3.1"])
      s.add_development_dependency(%q<capybara>.freeze, [">= 3.20.2"])
      s.add_development_dependency(%q<jquery-rails>.freeze, [">= 4.3.3"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.11.3"])
      s.add_development_dependency(%q<minitest-reporters>.freeze, ["~> 1.3.6"])
      s.add_development_dependency(%q<pry-byebug>.freeze, [">= 3.7.0"])
      s.add_development_dependency(%q<sassc>.freeze, [">= 2.0.0"])
      s.add_development_dependency(%q<sprockets-rails>.freeze, ["~> 3.2.1"])
      s.add_development_dependency(%q<turbolinks>.freeze, ["~> 5.2.0"])
      s.add_development_dependency(%q<uglifier>.freeze, ["~> 4.1.20"])
      s.add_development_dependency(%q<webdrivers>.freeze, [">= 3.9.4"])
    else
      s.add_dependency(%q<bootstrap>.freeze, ["~> 4.3.1"])
      s.add_dependency(%q<capybara>.freeze, [">= 3.20.2"])
      s.add_dependency(%q<jquery-rails>.freeze, [">= 4.3.3"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5.11.3"])
      s.add_dependency(%q<minitest-reporters>.freeze, ["~> 1.3.6"])
      s.add_dependency(%q<pry-byebug>.freeze, [">= 3.7.0"])
      s.add_dependency(%q<sassc>.freeze, [">= 2.0.0"])
      s.add_dependency(%q<sprockets-rails>.freeze, ["~> 3.2.1"])
      s.add_dependency(%q<turbolinks>.freeze, ["~> 5.2.0"])
      s.add_dependency(%q<uglifier>.freeze, ["~> 4.1.20"])
      s.add_dependency(%q<webdrivers>.freeze, [">= 3.9.4"])
    end
  else
    s.add_dependency(%q<bootstrap>.freeze, ["~> 4.3.1"])
    s.add_dependency(%q<capybara>.freeze, [">= 3.20.2"])
    s.add_dependency(%q<jquery-rails>.freeze, [">= 4.3.3"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.11.3"])
    s.add_dependency(%q<minitest-reporters>.freeze, ["~> 1.3.6"])
    s.add_dependency(%q<pry-byebug>.freeze, [">= 3.7.0"])
    s.add_dependency(%q<sassc>.freeze, [">= 2.0.0"])
    s.add_dependency(%q<sprockets-rails>.freeze, ["~> 3.2.1"])
    s.add_dependency(%q<turbolinks>.freeze, ["~> 5.2.0"])
    s.add_dependency(%q<uglifier>.freeze, ["~> 4.1.20"])
    s.add_dependency(%q<webdrivers>.freeze, [">= 3.9.4"])
  end
end
