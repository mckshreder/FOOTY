class User < ActiveRecord::Base
    # geocoded_by :location
    # after_validation :geocode 
    
    has_secure_password
    has_many :posts
    has_many :comments
    has_many :events

    validates :name, presence: true
   
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

    validates :password, presence: true, length: { in: 6..20 }, confirmation: true

  attr_reader :password #add this line right below our list of fields
    has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

#we also need to create an @password instance variable and set it's value in our setter method
# def password=(unencrypted_password)
#   unless unencrypted_password.empty?
#     @password = unencrypted_password
#     self.password_digest = BCrypt::Password.create(unencrypted_password)
#   end
# end
def to_partial_path
    'posts/post'
end

end
