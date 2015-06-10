class User < ActiveRecord::Base
	has_many :videos

	has_secure_password
	validates :password, confirmation: true
	validates :password_confirmation, presence: true

	has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
