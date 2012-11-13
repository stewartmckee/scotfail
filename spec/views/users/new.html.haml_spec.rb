require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :twitter_id => 1,
      :name => "MyString",
      :screen_name => "MyString",
      :location => "MyString",
      :description => "MyString",
      :url => "MyString",
      :profile_image_url => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path, :method => "post" do
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
