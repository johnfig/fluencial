class DevelopmentSeedBase
  def self.seed
    require 'factory_girl'
    FactoryGirl.find_definitions unless FactoryGirl.factories.count > 0
  end
end
