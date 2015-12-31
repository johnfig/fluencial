require 'rails_helper'

describe User do
  describe 'encryption' do
    it 'encrypts a password after a user signs up' do
      user = build :user
      expect(user.password).to eq 'password'
      user.save
      expect(user.password).to eq nil
    end
  end

  describe 'validations' do
    context 'email' do
      it 'has presence validation' do
        user = build :user, email: ''
        expect(user.save).to eq false
      end

      it 'has uniqueness validation' do
        user = build :user, email: 'test@test.com'
        user2 = build :user, email: 'test@test.com'
        expect(user.save).to eq true
        expect(user2.save).to eq false
      end
    end
  end

  describe '.authenticate' do
    it 'returns user if the user authenticates with the correct username and password' do
      user = create :user
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
      user = create :user
      user.assign_role('influencer')
      expect(user.roles).to eq ['influencer']
    end

    it 'adds another role if role exists' do
      user = create :user
      user.assign_role('influencer')
      user.assign_role('admin')
      expect(user.roles).to eq ['influencer', 'admin']
    end
  end
end

