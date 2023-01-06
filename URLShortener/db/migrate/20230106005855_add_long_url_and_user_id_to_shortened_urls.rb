class AddLongUrlAndUserIdToShortenedUrls < ActiveRecord::Migration[7.0]
  def change
    add_column :shortened_urls, :long_url, :string, null:false, index: {unique: true}
    add_column :shortened_urls, :user_id, :string, null:false, index: {unique: true}
  end
end
