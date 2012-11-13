class User < ActiveRecord::Base
  attr_accessible :description, :location, :name, :profile_image_url, :screen_name, :twitter_id, :url
  
  has_many :tweets, :foreign_key => :user_id, :primary_key => :twitter_id
  
end
