require 'spec_helper'

describe "tweets/index" do
  before(:each) do
    assign(:tweets, [
      stub_model(Tweet,
        :tweet_id => 1,
        :text => "Text",
        :in_reply_to_status_id => 2,
        :in_reply_to_user_id => 3,
        :in_reply_to_screen_name => "In Reply To Screen Name",
        :user_id => 4,
        :geo => "Geo"
      ),
      stub_model(Tweet,
        :tweet_id => 1,
        :text => "Text",
        :in_reply_to_status_id => 2,
        :in_reply_to_user_id => 3,
        :in_reply_to_screen_name => "In Reply To Screen Name",
        :user_id => 4,
        :geo => "Geo"
      )
    ])
  end

  it "renders a list of tweets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Text".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "In Reply To Screen Name".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Geo".to_s, :count => 2
  end
end
