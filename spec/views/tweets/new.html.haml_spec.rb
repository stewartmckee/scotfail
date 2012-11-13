require 'spec_helper'

describe "tweets/new" do
  before(:each) do
    assign(:tweet, stub_model(Tweet,
      :tweet_id => 1,
      :text => "MyString",
      :in_reply_to_status_id => 1,
      :in_reply_to_user_id => 1,
      :in_reply_to_screen_name => "MyString",
      :user_id => 1,
      :geo => "MyString"
    ).as_new_record)
  end

  it "renders new tweet form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tweets_path, :method => "post" do
      assert_select "input#tweet_tweet_id", :name => "tweet[tweet_id]"
      assert_select "input#tweet_text", :name => "tweet[text]"
      assert_select "input#tweet_in_reply_to_status_id", :name => "tweet[in_reply_to_status_id]"
      assert_select "input#tweet_in_reply_to_user_id", :name => "tweet[in_reply_to_user_id]"
      assert_select "input#tweet_in_reply_to_screen_name", :name => "tweet[in_reply_to_screen_name]"
      assert_select "input#tweet_user_id", :name => "tweet[user_id]"
      assert_select "input#tweet_geo", :name => "tweet[geo]"
    end
  end
end
