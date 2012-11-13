require 'spec_helper'

describe "tweets/show" do
  before(:each) do
    @tweet = assign(:tweet, stub_model(Tweet,
      :tweet_id => 1,
      :text => "Text",
      :in_reply_to_status_id => 2,
      :in_reply_to_user_id => 3,
      :in_reply_to_screen_name => "In Reply To Screen Name",
      :user_id => 4,
      :geo => "Geo"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Text/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/In Reply To Screen Name/)
    rendered.should match(/4/)
    rendered.should match(/Geo/)
  end
end
