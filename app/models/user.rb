class User < ActiveRecord::Base
	has_many :shipments
	has_many :trips
	has_many :reviews, dependent: :destroy
	before_save { self.email = email.downcase }
	validates :firstname, presence: true, length: { minimum: 2, maximum: 20 }
	validates :lastname, presence: true, length: { minimum: 2, maximum: 20 }
	VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 105 },
	                                uniqueness: { case_sensitive: false },
	                                format: { with: VALID_EMAIL_REGEX }
	validates :phone, presence: true, length: { minimum: 5, maximum: 20 }
	validates :role, inclusion: { in: %w(Customer Carrier),
													message: "Customer or Carrier"}
	validates :rating, numericality: true, inclusion: {in: 0..5, message: "should be in 0-5 range"}
	validates :password, :confirmation => true
	has_secure_password
	mount_uploader :picture, PictureUploader
	validate :picture_size
	default_scope -> { order(updated_at: :desc) }



	def self.search(search)
		if search
			where(["firstname LIKE ? OR lastname LIKE ? OR email LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%"])
		else
			all
		end

	end

	private
		def picture_size
			if picture.size > 3.megabytes
				errors.add(:picture, "should be less than 3 MB")
			end
		end
end
