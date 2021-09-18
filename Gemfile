source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '~> 5.2.3'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap-sass', '~> 3.4'
gem 'devise', '~> 4.2'
gem 'file_validators'
gem 'masonry-rails', '~> 0.2.4'
gem 'will_paginate', '~> 3.1.7'
gem 'will_paginate-bootstrap', '~> 1.0.1'
gem 'factory_bot_rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'simplecov', require: false, group: :test
  gem 'database_cleaner-active_record'
  gem 'rails-controller-testing'
end
group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
group :test do
  gem 'capybara', '>= 2.15'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
group :production do
  gem 'rails_12factor', '0.0.3'
end
