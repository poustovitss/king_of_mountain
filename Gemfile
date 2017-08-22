source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.3.4'
gem 'rails', '~> 5.1.1'

gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'ransack'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
# gem 'redis', '~> 3.0'

gem 'will_paginate'
gem 'will_paginate-bootstrap'
gem 'bootstrap-sass'
gem 'slim-rails'
gem 'font-awesome-rails'
gem 'simple_form'
gem 'gentelella-rails'

gem 'devise'
gem 'devise_lastseenable'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-vkontakte'

gem 'activeadmin'
#gem 'bugsnag'
gem 'paperclip'
gem 'pry'
gem 'money-rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
  gem 'rspec-rails'
  gem 'rails-controller-testing'
  gem 'factory_girl_rails'
  gem 'spring-commands-rspec'
  gem 'faker'
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'guard'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # code cleanup
  gem 'rubocop',              require: false
  gem 'traceroute',           require: false
  gem 'bullet'
  gem 'brakeman',             require: false
  gem 'rubycritic',           require: false
  gem 'rails_best_practices', require: false
  gem 'simplecov'
end

group :test do
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'shoulda-callback-matchers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
