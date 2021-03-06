class Event < ActiveRecord::Base
  # has_attached_file :image
  attr_accessor :user_id, :name, :image, :remote_image_url
  mount_uploader :image, ImageUploader
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  geocoded_by :address   # can also be an IP address
	after_validation :geocode 
	
  belongs_to :user

end
