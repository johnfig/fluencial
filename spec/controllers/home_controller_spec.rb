require 'rails_helper'

describe HomeController do
  describe '#index' do
    subject { get :index }
    specify { expect(subject).to render_template('index') }
  end
end
