class DevelopmentSeedBase
  def self.seed
    raise 'Are you crazy?' if Rails.env.production?

    require 'factory_girl'
    FactoryGirl.find_definitions unless FactoryGirl.factories.count > 0
  end
end
