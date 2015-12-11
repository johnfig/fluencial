require 'rails_helper'

RSpec.describe "users/edit", :type => :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :email => "MyString",
      :password => "MyString",
      :first_name => "MyString",
      :last_name => "MyString",
      :encypted_password => "MyString",
      :salt => "MyString",
      :roles => "MyString",
      :instagram_username => "MyString",
      :company_name => "MyString",
      :company_url => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_password[name=?]", "user[password]"

      assert_select "input#user_first_name[name=?]", "user[first_name]"

      assert_select "input#user_last_name[name=?]", "user[last_name]"

      assert_select "input#user_encypted_password[name=?]", "user[encypted_password]"

      assert_select "input#user_salt[name=?]", "user[salt]"

      assert_select "input#user_roles[name=?]", "user[roles]"

      assert_select "input#user_instagram_username[name=?]", "user[instagram_username]"

      assert_select "input#user_company_name[name=?]", "user[company_name]"

      assert_select "input#user_company_url[name=?]", "user[company_url]"
    end
  end
end
