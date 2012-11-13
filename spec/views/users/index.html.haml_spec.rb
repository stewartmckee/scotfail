require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
        :twitter_id => 1,
        :name => "Name",
        :screen_name => "Screen Name",
        :location => "Location",
        :description => "Description",
        :url => "Url",
        :profile_image_url => "Profile Image Url"
      ),
      stub_model(User,
        :twitter_id => 1,
        :name => "Name",
        :screen_name => "Screen Name",
        :location => "Location",
        :description => "Description",
        :url => "Url",
        :profile_image_url => "Profile Image Url"
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Screen Name".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Profile Image Url".to_s, :count => 2
  end
end
