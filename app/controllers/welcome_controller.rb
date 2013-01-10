class WelcomeController < ApplicationController
  def index
    @today_counts = {}
    Tweet.today.group_by{|t| t.classification}.map{|classification, tweets| @today_counts[classification.downcase.to_sym] = tweets.count}
    @tweets = Tweet.latest

    first_date = Date.parse(Tweet.first.tweeted_at.to_s)
    classified_tweets = Tweet.by_classification


    @first_line_graph_tweet = Tweet.last30days.first ? Tweet.last30days.first.tweeted_at : DateTime.now
    @line_graph_data = Tweet.last30days.count_by_date_and_classification

    @first_pie_chart_tweet = Tweet.all.first.tweeted_at
    @pie_chart_data = Tweet.count_by_classification

  end
end
