class Tweet < ActiveRecord::Base
  attr_accessible :geo, :in_reply_to_screen_name, :in_reply_to_status_id, :in_reply_to_user_id, :text, :tweet_id, :tweeted_at, :user_id, :classified, :classification

  belongs_to :user, :foreign_key => :user_id, :primary_key => :twitter_id

  scope :today, lambda {where("DATE(tweeted_at) = ?", Date.today)}
  scope :last30days, lambda {where("DATE(tweeted_at) > ?", 30.days.ago)}
  scope :latest, lambda {order("tweeted_at DESC").limit(5)}
  scope :unclassified, lambda {where("classified = ?", false)}
  
  before_save :update_classification
  
  def update_classification
    self.classification = self.classify
    puts "classification: #{self.classification}"
  end
  
  def self.count_by_date_and_classification
    order("DATE(tweeted_at)").group("DATE(tweeted_at)").count
  end
  
  def self.count_by_date_and_classification
    dates = []
    t = {}
    classified_tweets = order("").by_classification
    classified_tweets.keys.each do |classification|
      t[classification] = {}
      tweets = classified_tweets[classification]
      tweets.each do |tweet|
        date = tweet.tweeted_at.day
        dates << date unless dates.include?(date)
        
        if t[classification].has_key?(date)
          t[classification][date] += 1
        else
          t[classification][date] = 1
        end
      end
    end
    
    # make sure we have values for every date in each classification
    dates.each do |date|
      classified_tweets.keys.each do |classification|
        unless t[classification].has_key?(date)
          t[classification][date] = 0
        end
      end
    end
    t
  end
  
  def self.count_by_classification
    t = {}
    classified_tweets = order("").by_classification
    classified_tweets.keys.each do |classification|
      t[classification] = classified_tweets[classification].count
    end
    t
  end
  
  def self.by_classification
    classified_tweets = {:positive => [], :negative => [], :neutral => []}
    order("").all.each do |tweet|
      classified_tweets[tweet.classification.downcase.to_sym] << tweet
    end
    classified_tweets
  end
  
  def classify
    BAYESIAN.classify(text)
  end

  def positive?
    classification == "Positive"
  end

  def neutral?
    classification == "Neutral"
  end

  def negative?
    classification == "Negative"
  end

end
