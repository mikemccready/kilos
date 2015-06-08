class User < ActiveRecord::Base
	has_secure_password
	has_many :videos
	attr_accessor :image_file_name
	has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
