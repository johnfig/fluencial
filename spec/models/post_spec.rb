require 'rails_helper'

describe Post do
  describe 'validations' do
    let(:post) { create :post, instagram_id: '123' }
    it 'validates uniqueness' do
      create :post, instagram_id: '123'
      expect{post}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end

