require 'rails_helper'

RSpec.describe "users/index", :type => :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :email => "Email",
        :password => "Password",
        :first_name => "First Name",
        :last_name => "Last Name",
        :encypted_password => "Encypted Password",
        :salt => "Salt",
        :roles => "Roles",
        :instagram_username => "Instagram Username",
        :company_name => "Company Name",
        :company_url => "Company Url"
      ),
      User.create!(
        :email => "Email",
        :password => "Password",
        :first_name => "First Name",
        :last_name => "Last Name",
        :encypted_password => "Encypted Password",
        :salt => "Salt",
        :roles => "Roles",
        :instagram_username => "Instagram Username",
        :company_name => "Company Name",
        :company_url => "Company Url"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Encypted Password".to_s, :count => 2
    assert_select "tr>td", :text => "Salt".to_s, :count => 2
    assert_select "tr>td", :text => "Roles".to_s, :count => 2
    assert_select "tr>td", :text => "Instagram Username".to_s, :count => 2
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => "Company Url".to_s, :count => 2
  end
end
