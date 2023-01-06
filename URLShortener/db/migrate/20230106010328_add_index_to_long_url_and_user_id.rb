class AddIndexToLongUrlAndUserId < ActiveRecord::Migration[7.0]
  def change
    add_index :shortened_urls, :long_url, unique: true
    add_index :shortened_urls, :user_id, unique: true
  end
end
