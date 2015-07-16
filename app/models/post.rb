class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  # geocoded_by :location
  # def self.get_post_data (post,location_value,user_id)
  # 		self.create_with (
  # 			title: post.title,
  # 			location: friend.location,
  # 			latitude: lovation_value.first,
  # 			longitude: location_value.second).find_or_create_by(
  # 			user_id: user_id)
  # 		end
  # end

  # validates :title, presence: true
  # validates :artist, presence: true
  # validates :url, presence: true
  # validates :body, presence: true
end
