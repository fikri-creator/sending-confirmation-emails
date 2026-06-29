ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

# Ruby 2.7 + Rails 6.1 requires logger to be loaded before activesupport
# (logger became a default gem in 2.7 and is no longer auto-required).
require "logger"

require "bundler/setup" # Set up gems listed in the Gemfile.
require "bootsnap/setup" # Speed up boot time by caching expensive operations.
