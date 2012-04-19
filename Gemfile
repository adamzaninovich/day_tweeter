source 'https://rubygems.org'

gem 'rails', '3.2.2'

gem 'jquery-rails',       '~> 2.0.1'
gem 'haml-rails',         '~> 0.3.4'
gem 'omniauth-twitter',   '~> 0.0.8'
gem 'twitter',            '~> 2.1.0'
#gem 'copycopter_client',  '~> 2.0.0'
gem 'capistrano',         '~> 2.12.0'

group :scheduling do
  gem 'resque',           '~> 1.20.0'
  gem 'resque-scheduler', '~> 1.9.9'
end

group :production do
  gem 'pg',       '~> 0.13.2'
  gem 'unicorn',  '~> 4.3.0' 
end

group :development do
  gem 'heroku',   require: false
  gem 'foreman',  require: false
end

group :development, :test do
  gem 'thin'
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'spork'
  gem 'autotest',            require: false
  gem 'autotest-rails-pure', require: false
  gem 'autotest-fsevent',    require: false
  gem 'autotest-growl',      require: false
end

group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'vcr'
  gem 'webmock'
  gem 'timecop'
end

group :assets do
  gem 'sass-rails',               '~> 3.2.3'
  gem 'coffee-rails',             '~> 3.2.1'
  gem 'uglifier',                 '>= 1.0.3'
  gem 'twitter-bootstrap-rails',  '~> 2.0.3'
end