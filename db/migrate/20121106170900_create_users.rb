class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :twitter_id
      t.string :name
      t.string :screen_name
      t.string :location
      t.string :description
      t.string :url
      t.string :profile_image_url

      t.timestamps
    end
  end
end
