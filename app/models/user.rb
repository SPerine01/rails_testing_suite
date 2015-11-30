class User < ActiveRecord::Base
	has_many :posts
	has_secure_password
	validates_presence_of :name, :birthday, :email
	validates_uniqueness_of :email
end
