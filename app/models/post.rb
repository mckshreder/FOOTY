class Post < ActiveRecord::Base
 
 geocoded_by :address   # can also be an IP address
	after_validation :geocode 
	
  belongs_to :user
  has_many :comments
  validates :title, presence: true
  validates :body, presence: true
  validates :youtube_url, presence: true
  



end
