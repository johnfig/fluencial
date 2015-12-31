require 'rails_helper'

describe HomeController do
  let!(:influencer) { create :user, :influencer }
  describe '#index' do
    subject { get :index }
    specify { expect(subject).to render_template('index') }
    specify do
      subject
      expect(assigns(:top_users)).to eq [influencer]
    end
  end
end
