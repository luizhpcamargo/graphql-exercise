source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

gem 'rails', '~> 6.1.7.4'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0', '>= 5.0.8'
gem 'uglifier', '>= 1.3.0'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'slim-rails', '>= 3.2.0'
gem 'pg', '~> 1.0'
gem 'graphlient'

gem 'foundation-rails', '>= 5.5.0.0'
gem 'autoprefixer-rails'
gem 'draper', '>= 3.1.0'

group :development, :test do
  gem 'sqlite3'
  gem 'pry'
  gem 'rspec-rails', '>= 3.8.0'
  gem 'factory_bot_rails', '>= 4.10.0'
end

group :development do
  gem 'web-console', '>= 3.6.0'
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
