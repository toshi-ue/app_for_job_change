source 'https://rubygems.org'

gem 'nokogiri'
gem 'rack', '~> 2.0.1'
gem 'rspec'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'acts-as-taggable-on'
gem 'bootstrap4-kaminari-views'
gem 'carrierwave'
gem 'counter_culture'
gem 'devise'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'discard'
gem 'dotenv-rails'
gem 'enum_help'
gem 'font-awesome-sass'
gem 'jbuilder', '~> 2.5'
gem 'kaminari'
gem 'mini_magick'
gem 'mysql2', '>= 0.3.18', '< 0.6.0'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.7'
gem 'rails-i18n'
gem 'ranked-model'
gem 'ransack'
gem 'sassc-rails'
gem 'seed-fu'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'

group :development, :test do
  gem 'awesome_print'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'gimei'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rails-flog', require: 'flog'
  gem 'rspec-rails'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'foreman'
  gem 'letter_opener_web'
  gem 'listen'
  gem 'rubocop', require: false
  gem 'rubocop-performance'
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'solargraph'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'launchy'
  gem "rspec_junit_formatter"
  gem 'selenium-webdriver'
  gem 'shoulda-matchers',
      git: 'https://github.com/thoughtbot/shoulda-matchers.git',
      branch: 'rails-5'
  gem 'simplecov'
  gem 'vcr'
  gem 'webdrivers'
  gem 'webmock'
end

gem 'tzinfo-data'
# gem 'therubyracer', platforms: :ruby
# gem 'capistrano-rails', group: :development
# gem 'bcrypt', '~> 3.1.7'
