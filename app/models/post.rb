class Post < ActiveRecord::Base
  geocoded_by :location
  belongs_to :user
  has_many :comments
  validates :title, presence: true
  validates :body, presence: true
  validates :youtube_url, presence: true
  



end
