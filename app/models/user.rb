class User < ActiveRecord::Base

	#change to lowercase before saving the user data to database
	before_save { self.email = email.downcase }

	#name should be present with maximum length of 50 chars
	validates :name,  presence: true, length: { maximum: 50 }

	#Regex for validating email addresses
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, 
	                  format: { with: VALID_EMAIL_REGEX },
	          		  uniqueness: { case_sensitive: false }

	has_secure_password
    validates :password, length: { minimum: 6 }
end
