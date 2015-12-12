require 'rails_helper'

describe SessionsController do
  describe '#new' do
    it 'returns http success' do
      get :new
      expect(response).to be_success
    end
  end

  describe '#create' do
    let(:user) { FactoryGirl.create :user }
    subject { post :create, session: { email: user.email, password: 'password' } }

    describe 'successful login' do
      it 'authenticats the user, sets the session and redirects to root_path' do
        expect(subject).to redirect_to root_path
        expect(flash[:notice]).to eq 'Welcome back!'
      end
    end
    describe 'failed login' do
      subject { post :create, session: { email: 'asdf', password: 'password' } }
      it 'returns to new and flashes error' do
        expect(subject).to render_template 'new'
        expect(flash[:danger]).to eq 'Invalid email/password combination'
      end
    end
  end
end
