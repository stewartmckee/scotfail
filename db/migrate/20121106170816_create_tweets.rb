class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.datetime :tweeted_at
      t.integer :tweet_id
      t.string :text
      t.integer :in_reply_to_status_id
      t.integer :in_reply_to_user_id
      t.string :in_reply_to_screen_name
      t.integer :user_id
      t.string :geo

      t.timestamps
    end
  end
end
