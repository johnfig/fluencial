require 'rails_helper'

describe SessionsHelper do
  let(:user) { create :user }

  describe '#log_in' do
    it 'sets the session user_id' do
      log_in user
      expect(session[:user_id]).to eq user.id
    end
  end

  describe '#current_user' do
    it 'memoizes the current_user' do
      expect(current_user).to eq nil
      session[:user_id] = user.id
      expect(current_user).to eq user
    end
  end

  describe '#logged_in?' do
    it 'returns true when user logged in' do
      expect(logged_in?).to eq false
    end

    it 'returns false when user not logged in' do
      session[:user_id] = user.id
      expect(logged_in?).to eq true
    end
  end

  describe '#log_out' do
    it 'deletes the session and sets current_user to nil' do
      log_in user
      expect(session[:user_id]).to eq user.id
      expect(current_user).to eq user
      log_out
      expect(session[:user_id]).to eq nil
      expect(current_user).to eq nil
    end
  end
end
