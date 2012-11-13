class ChangeTwitterIdsToBigint < ActiveRecord::Migration
  def up
    change_column :tweets, :tweet_id, :bigint
    change_column :tweets, :in_reply_to_status_id, :bigint
    change_column :tweets, :in_reply_to_user_id, :bigint
    change_column :tweets, :user_id, :bigint
    
    change_column :users, :twitter_id, :bigint
  end

  def down
    change_column :tweets, :tweet_id, :integer
    change_column :tweets, :in_reply_to_status_id, :integer
    change_column :tweets, :in_reply_to_user_id, :integer
    change_column :tweets, :user_id, :integer
    
    change_column :users, :twitter_id, :integer
  end
end
