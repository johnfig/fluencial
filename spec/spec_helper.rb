require File.expand_path("../../config/environment", __FILE__)
require 'database_cleaner'
require 'rspec/rails'
require 'factory_girl_rails'
require 'vcr'
require 'webmock/rspec'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.ignore_localhost = true
  c.configure_rspec_metadata!
end

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.after(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.after(:all) do
    DatabaseCleaner.strategy = :transaction
  end
end