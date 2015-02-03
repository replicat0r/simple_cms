class AdminUser < ActiveRecord::Base

	has_and_belongs_to_many :pages
	has_many :section_edits 
	has_many :sections , :through => :section_edits


	has_secure_password

	# validates_presence_of :first_name, :last_name, :username, :email
	# validates_length_of :first_name, :maximum => 25

	# validates :first_name , length: {minimum: 2, maximum: 255}


end
