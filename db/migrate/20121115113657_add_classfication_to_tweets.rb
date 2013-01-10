class AddClassficationToTweets < ActiveRecord::Migration
  def up
    #add_column :tweets, :classification, :string
    
    Tweet.all.each do |tweet|
      tweet.update_attributes(:classification => tweet.classify)
    end
  end
  def down
    remove_column :tweets, :classification
    
  end
end
