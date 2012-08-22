#encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "catarse_mailchimp/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "catarse_mailchimp"
  s.version     = CatarseMailchimp::VERSION
  s.authors     = ["Antônio Roberto Silva"]
  s.email       = ["forevertonny@gmail.com"]
  s.homepage    = "http://github.com/devton/catarse_mailchimp"
  s.summary     = "MailChimp integration with Catarse"
  s.description = "MailChimp integration with Catarse crowdfunding platform"

  s.files = `git ls-files`.split($\)

  s.add_dependency "rails", "~> 3.2.6"
  s.add_dependency "mailchimp"

  s.add_development_dependency "rspec-rails"
end
