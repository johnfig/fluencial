require 'factory_girl'

FactoryGirl.define do
  factory :user do
    first_name 'Mario'
    last_name 'Pipes'
    email 'mario@pipes'
    password 'password'
  end
end
