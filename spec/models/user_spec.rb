require 'rails_helper'

describe User do
  describe 'encryption' do
    it 'encrypts a password after a user signs up' do
      user = FactoryGirl.build :user
      expect(user.password).to eq 'password'
      user.save
      expect(user.password).to eq nil
    end
  end

  describe '.authenticate' do
    it 'returns user if the user authenticates with the correct username and password' do
      user = FactoryGirl.create :user
      expect(User.authenticate(user.email, 'password')).to eq user
    end
  end
end
