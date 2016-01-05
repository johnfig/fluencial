require_relative 'development_seed_base'

class UserSeed < DevelopmentSeedBase
  def self.seed
    super

    reset

    female_profiles.each do |photo_url, name|
      user = FactoryGirl.create :user, :influencer, profile_picture_url: photo_url, first_name: name
      20.times do
        FactoryGirl.create :post, user: user, standard_resolution_url: photo_url, low_resolution_url: photo_url
      end
    end

    male_profiles.each do |photo_url, name|
      user = FactoryGirl.create :user, :influencer, profile_picture_url: photo_url, first_name: name
      20.times do
        FactoryGirl.create :post, user: user, standard_resolution_url: photo_url, low_resolution_url: photo_url
      end
    end

    10.times { FactoryGirl.create :user, :advertiser }
  end

  def self.female_profiles
    [
      ['http://f.cl.ly/items/411E1U0A2S3k3x2U1f06/Image%202016-01-04%20at%206.59.27%20PM.png', 'Gabrielle'],
      ['http://f.cl.ly/items/0U233A3A1z0g3J1E1C2w/Image%202016-01-04%20at%207.09.33%20PM.png', 'Rachel'],
      ['http://f.cl.ly/items/3v0p1w0V372G1s0d1u40/Image%202016-01-04%20at%207.26.43%20PM.png', 'Renee'],
      ['http://f.cl.ly/items/1x3h3W132l050i2b2q0x/Image%202016-01-04%20at%207.31.28%20PM.png', 'Lippy'],
      ['http://f.cl.ly/items/1g182Z0l1R2v3B103f2k/Image%202016-01-04%20at%207.32.22%20PM.png', 'Sporty Spice'],
      ['http://f.cl.ly/items/411E1U0A2S3k3x2U1f06/Image%202016-01-04%20at%206.59.27%20PM.png', 'Gabby'],
    ]
  end

  def self.male_profiles
    [
      ['http://f.cl.ly/items/16331P1J1E0y2l0B3235/Image%202016-01-04%20at%207.10.51%20PM.png', 'Enrique'],
      ['http://f.cl.ly/items/2e1H0U1W2o0R1Y2V3u2r/Image%202016-01-04%20at%207.15.22%20PM.png', 'Brobot'],
      ['http://f.cl.ly/items/0i3n1T1f3Y2e3s2h232X/Image%202016-01-04%20at%207.27.37%20PM.png', 'Luke'],
      ['http://f.cl.ly/items/0R0x2N0A1Q0x3Z2d2714/Image%202016-01-04%20at%207.29.28%20PM.png', 'Bromance'],
      ['http://f.cl.ly/items/1N332x0h1O3Y1J3K1B2w/Image%202016-01-04%20at%207.33.56%20PM.png', 'Rico suave']
    ]
  end

  def self.reset
    User.delete_all
    Post.delete_all
  end
end
