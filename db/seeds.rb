require 'factory_girl'
FactoryGirl.find_definitions unless FactoryGirl.factories.count > 0

10.times { FactoryGirl.create :user, :influencer }
10.times { FactoryGirl.create :user, :advertiser }
