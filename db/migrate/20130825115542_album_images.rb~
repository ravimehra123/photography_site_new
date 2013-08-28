class AlbumImages < ActiveRecord::Migration
  def change
    create_table "album_images", :force => true do |t|
      t.integer "album_id"
      t.string  "album_image_file_name",    :limit => 100
      t.integer "album_image_file_size"
      t.string  "album_image_file_type",    :limit => 50
      t.string  "album_image_content_type", :limit => 50
      t.string  "status",                   :limit => 1
      t.integer "order_no"
      t.text    "caption"
      t.date    "upload_date"
    end
  end
end
