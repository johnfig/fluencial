require 'factory_girl'

FactoryGirl.define do
  factory :user do
    first_name 'Mario'
    last_name 'Pipes'
    email 'mario@pipes'
    password 'password'

    trait :influencer do
      after(:build) do |instance|
        instance.assign_role('influencer')
      end
    end

    trait :advertiser do
      after(:build) do |instance|
        instance.assign_role('advertiser')
      end
    end
  end
end
