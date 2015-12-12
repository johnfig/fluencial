source 'https://rubygems.org'

ruby '2.1.2'

gem 'rails', '4.2.0'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'puma'
gem 'slim'
gem 'bcrypt-ruby', :require => 'bcrypt'
gem 'awesome_print'
gem 'bootstrap-sass', '~> 3.3.6'

group :production do
  gem 'rails_12factor', group: :production
end

group :development do
  gem 'spring'
  gem 'pry', '~> 0.10.0'
end

group :development, :test do
  gem 'rspec', '~> 3.1'
  gem 'factory_girl_rails', :require => false
  gem 'rspec-rails', '~> 3.1'
end

group :test do
  gem 'webmock', require: true
  gem 'vcr'
  gem 'database_cleaner', '~> 1.3.0'
end
