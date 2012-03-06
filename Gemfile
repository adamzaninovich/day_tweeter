source 'https://rubygems.org'

gem 'rails', '3.2.2'

gem 'jquery-rails',     '~> 2.0.1'
gem 'haml-rails',       '~> 0.3.4'
gem 'omniauth-twitter', '~> 0.0.8'
gem 'twitter',          '~> 2.1.0'

group :production do
  gem 'pg', '0.13.2'
end

group :development do
  gem 'heroku', require: false
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'launchy'
  gem 'spork'
  gem 'vcr'
  gem 'webmock'
  gem 'timecop'
  gem 'autotest',            require: false
  gem 'autotest-rails-pure', require: false
  gem 'autotest-fsevent',    require: false
  gem 'autotest-growl',      require: false
end

group :assets do
  gem 'sass-rails',               '~> 3.2.3'
  gem 'coffee-rails',             '~> 3.2.1'
  gem 'uglifier',                 '>= 1.0.3'
  gem 'twitter-bootstrap-rails',  '~> 2.0.3'
end