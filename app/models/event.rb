class Event < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  geocoded_by :address   # can also be an IP address
	after_validation :geocode 
	
  belongs_to :user

  # mount_uploader :avatar, AvatarUploader
end
