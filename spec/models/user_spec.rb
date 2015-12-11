require 'rails_helper'

describe User do
  it 'encrypts a password after a user signs up' do

    user = FactoryGirl.build :user
    expect(user.password).to eq 'password'
    user.save
    expect(user.password).to eq nil
  end
end
