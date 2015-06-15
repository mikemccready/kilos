class User < ActiveRecord::Base
	has_many :videos

	has_many :followings
	has_many :followers, :through => :followings
	has_many :inverse_followings, class_name:"Following", foreign_key:"follower_id"
	has_many :inverse_followers, :through => :inverse_followings, :source => :user

	has_secure_password

	has_attached_file :image, styles: { small: "33x33", med: "100x100", large: "200x200", default_url: "asset_path( 'pawn.jpg' )"  }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
