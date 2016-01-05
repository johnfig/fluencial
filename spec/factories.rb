require 'factory_girl'

FactoryGirl.define do
  factory :user do
    first_name 'Mario'
    last_name 'Pipes'
    email 'mario@pipes'
    password 'password'

    trait :influencer do
      sequence :instagram_username do |n|
        "some_user_#{n}"
      end

      access_token '13820659.67963d7.4e97faa1d48748889ddc637f8265fd31'
      profile_picture_url 'https://scontent.cdninstagram.com/hphotos-xtf1/t51.2885-19/11821765_426467924208095_1150540661_a.jpg'
      posts_count { rand(1000..3000) }
      followed_by { rand(10000..250000) }

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

  factory :post do
    instagram_id { SecureRandom.uuid }
    low_resolution_url 'https://scontent.cdninstagram.com/hphotos-xtf1/t51.2885-19/11821765_426467924208095_1150540661_a.jpg'
    standard_resolution_url 'https://scontent.cdninstagram.com/hphotos-xtf1/t51.2885-19/11821765_426467924208095_1150540661_a.jpg'
    comments_count { rand(250..3000) }
    likes_count { rand(5000..25000) }
  end
end
