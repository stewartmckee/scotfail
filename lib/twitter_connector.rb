class TwitterConnector
  
  BANNED_USERS = [109010049, 455056617, 61569136, 44108941, 930161562]
  
  def self.latest
    Twitter.configure do |config|
      config.consumer_key = "nJtukKXMbwbQGOqG8Vrwtw"
      config.consumer_secret = "eP2V8l4cVWZuwzn1XyTViv4OBUxp9wWGvH1D4TpEvc"
      config.oauth_token = "17309665-5AorXWvjzZeYAazmSWLGMrzjT85kTVjN62NYfJmMI"
      config.oauth_token_secret = "s2uj0cTceRMHQ4BuC2WWlf67A3fHqSZZhNW56fHp8"
    end
    
    @tweets = Twitter.search("scotrail OR scotfail", :count => 100)
  end
  
  def self.update

    Twitter.configure do |config|
      config.consumer_key = "nJtukKXMbwbQGOqG8Vrwtw"
      config.consumer_secret = "eP2V8l4cVWZuwzn1XyTViv4OBUxp9wWGvH1D4TpEvc"
      config.oauth_token = "17309665-5AorXWvjzZeYAazmSWLGMrzjT85kTVjN62NYfJmMI"
      config.oauth_token_secret = "s2uj0cTceRMHQ4BuC2WWlf67A3fHqSZZhNW56fHp8"
    end
    
    tweets_created = 0
    users_created = 0

    if Tweet.count == 0
      @tweets = Twitter.search("scotrail OR scotfail", :count => 100)
    else
      @tweets = Twitter.search("scotrail OR scotfail", :count => 100, :since_id => Tweet.order("tweeted_at DESC").limit(1).first.tweet_id, :result_type => "recent")
    end
    @tweets = @tweets.statuses.reject{|tweet| BANNED_USERS.include?(tweet.user.id)}
    @tweets.each do |tweet|
      unless Tweet.exists?(:tweet_id => tweet.id)
        tweets_created += 1
        Tweet.create!(:tweeted_at => tweet.created_at, :tweet_id => tweet.id, :text => tweet.text, :in_reply_to_status_id => tweet.in_reply_to_status_id, :in_reply_to_user_id => tweet.in_reply_to_user_id, :in_reply_to_screen_name => tweet.in_reply_to_screen_name, :user_id => tweet.user[:id], :geo => tweet.geo.to_json)
      end
      unless User.exists?(:twitter_id => tweet.user.id)
        users_created += 1
        User.create!(:twitter_id => tweet.user[:id], :name => tweet.user[:name], :screen_name => tweet.user[:screen_name], :location => tweet.user[:location], :description => tweet.user[:description], :url => tweet.user[:url], :profile_image_url => tweet.user[:profile_image_url])
      end
    end
    
    puts "Created #{tweets_created} new tweets and #{users_created} new users."
    
    true
  end


end
