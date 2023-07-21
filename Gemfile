# frozen_string_literal: true

source 'https://rubygems.org'

# Specify your gem's dependencies in hexlet_code.gemspec
gemspec

gem 'rake', '~> 13.0'

group :development do
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rspec'
end

group :test do
  gem 'simplecov', require: false
end

group :development, :test do
  gem 'minitest'
end
