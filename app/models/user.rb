class User < ActiveRecord::Base
	has_many :videos

	has_secure_password

	has_attached_file :image, styles: { small: "30x30", med: "100x100", large: "200x200" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
