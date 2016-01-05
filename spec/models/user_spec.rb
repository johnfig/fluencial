require 'rails_helper'

describe User do
  let(:user) { create :user }

  describe 'callbacks' do
    context 'encryption' do
      it 'encrypts a password after a user signs up' do
        user = build :user
        expect(user.password).to eq 'password'
        user.save
        expect(user.password).to eq nil
      end
    end

    describe 'set_gender' do
      it 'sets gender before saving' do
        user = build :user, first_name: 'John'
        user.save
        expect(user.gender).to eq 2

        user = build :user, first_name: 'gabriella'
        user.save
        expect(user.gender).to eq 1

        user = build :user, first_name: 'blah'
        user.save
        expect(user.gender).to eq 0
      end
    end
  end

  describe 'scopes' do
    describe '.with_role' do
      it 'returns array of only specific roles' do
        influencer = create :user, :influencer
        advertiser = create :user, :advertiser
        expect(User.with_role('influencer')).to eq [influencer]
        expect(User.with_role('advertiser')).to eq [advertiser]
      end
    end

    describe '.most_followed' do
      it 'returns array of only specific roles' do
        influencer1 = create :user, :influencer, followed_by: 1500
        influencer2 = create :user, :influencer, followed_by: 2000
        expect(User.most_followed).to eq [influencer2, influencer1]
      end
    end
  end

  describe '.authenticate' do
    it 'returns user if the user authenticates with the correct username and password' do
      expect(User.authenticate(user.email, 'password')).to eq user
    end
  end

  describe '#is_advertiser?' do
    it 'returns true if advertiser' do
      user = create :user, roles: ['advertiser']
      expect(user.is_advertiser?).to eq true
    end

    it 'returns false if not advertiser' do
      user = create :user, roles: ['blah blah']
      expect(user.is_advertiser?).to eq false
    end
  end

  describe '#is_influencer?' do
    it 'returns true if influencer' do
      user = create :user, roles: ['influencer']
      expect(user.is_influencer?).to eq true
    end

    it 'returns false if not influencer' do
      user = create :user, roles: ['blah blah']
      expect(user.is_influencer?).to eq false
    end
  end

  describe '#full_name' do
    it 'returns true if influencer' do
      user = create :user
      expect(user.full_name).to eq 'Mario Pipes'
    end
  end

  describe '#assign_role' do
    it 'assigns a role if no role exists' do
      user.assign_role('influencer')
      expect(user.roles).to eq ['influencer']
    end

    it 'adds another role if role exists' do
      user.assign_role('influencer')
      user.assign_role('admin')
      expect(user.roles).to eq ['influencer', 'admin']
    end
  end
end

