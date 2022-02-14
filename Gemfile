source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

gem 'rails', '~> 5.2.6.2'
gem 'puma', '~> 4.3', '>= 4.3.11'
gem 'sass-rails', '~> 5.0', '>= 5.0.7'
gem 'uglifier', '>= 1.3.0'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'slim-rails', '>= 3.1.3'
gem 'pg', '~> 1.0'
gem 'graphlient'

gem 'foundation-rails', '>= 5.4.5.0'
gem 'autoprefixer-rails'
gem 'draper', '>= 3.0.1'

group :development, :test do
  gem 'sqlite3'
  gem 'pry'
  gem 'rspec-rails', '>= 3.7.2'
  gem 'factory_bot_rails', '>= 4.8.2'
end

group :development do
  gem 'web-console', '>= 3.5.1'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '~> 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'shoulda-matchers'
  gem 'webmock'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
