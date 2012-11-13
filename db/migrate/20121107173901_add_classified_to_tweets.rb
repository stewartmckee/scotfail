class AddClassifiedToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :classified, :boolean, :default => false
  end
end
