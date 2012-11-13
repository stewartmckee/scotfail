require 'spec_helper'

describe "users/edit" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :twitter_id => 1,
      :name => "MyString",
      :screen_name => "MyString",
      :location => "MyString",
      :description => "MyString",
      :url => "MyString",
      :profile_image_url => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path(@user), :method => "post" do
      assert_select "input#user_twitter_id", :name => "user[twitter_id]"
      assert_select "input#user_name", :name => "user[name]"
      assert_select "input#user_screen_name", :name => "user[screen_name]"
      assert_select "input#user_location", :name => "user[location]"
      assert_select "input#user_description", :name => "user[description]"
      assert_select "input#user_url", :name => "user[url]"
      assert_select "input#user_profile_image_url", :name => "user[profile_image_url]"
    end
  end
end
