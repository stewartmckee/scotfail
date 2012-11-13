require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :twitter_id => 1,
      :name => "Name",
      :screen_name => "Screen Name",
      :location => "Location",
      :description => "Description",
      :url => "Url",
      :profile_image_url => "Profile Image Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/Screen Name/)
    rendered.should match(/Location/)
    rendered.should match(/Description/)
    rendered.should match(/Url/)
    rendered.should match(/Profile Image Url/)
  end
end
