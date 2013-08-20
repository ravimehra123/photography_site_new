class Album < ActiveRecord::Base
  attr_accessible :title, :status
  has_many :album_images, :dependent => :destroy
end
