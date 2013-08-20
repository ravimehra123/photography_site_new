class AlbumImage < ActiveRecord::Base
  attr_accessible :album_image, :album_id, :status, :upload_date
  belongs_to :album 

	# validates_attachment_presence :album_image
	has_attached_file :album_image, :content_type => ['image/jpeg', 'image/png','image/gif'],											
																			:styles => { :small=>"100x100>",
																									 :large => "800x800>"}, 
																			 :message => "is not a valid image"

  # validates_attachment_size :album_image, :less_than => 3.megabytes 
end
