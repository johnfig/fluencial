require_relative 'development_seed_base'

class UserSeed < DevelopmentSeedBase
  def self.seed
    super

    reset
    10.times { FactoryGirl.create :user, :influencer }
    10.times { FactoryGirl.create :user, :advertiser }
  end

  def self.reset
    User.destroy_all
  end
end
