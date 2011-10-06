# Encoding: UTF-8
require 'rubygems'

require File.expand_path('../lib/configured/version', __FILE__)

Gem::Specification.new do |s|
  s.name = "configured"
  s.version = Configured::Version::STRING
  s.platform = Gem::Platform::RUBY
  s.author = "nettsundere"
  s.email = "nettsundere@gmail.com"
  s.homepage = "https://github.com/nettsundere/configured"
  s.summary = "#{Configured::Version::SUMMARY}"
  s.description = "configured. Use your database.yaml in rails initters. For redis, redis-store and e.t.c."
  s.files = Dir["{lib/*,lib/*/*,spec/*}"] + %w{README.md Rakefile}
end
