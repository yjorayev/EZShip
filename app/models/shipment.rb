class Shipment < ActiveRecord::Base
	belongs_to :user
	validates :user_id , presence: true
	validates :title, presence: true, length: { minimum: 2, maximum: 30}
	validates :pcountry, presence: true
	validates :pstate, presence: true
	validates :pcity, presence: true
	validates :paddress, presence: true
	validates :pzipcode, presence: true, numericality: true
	validates :dcountry, presence: true
	validates :dstate, presence: true
	validates :dcity, presence: true
	validates :daddress, presence: true
	validates :dzipcode, presence: true, numericality: true
	validates :weight, presence: true, numericality: true 
	validates :heigth, presence: true, numericality: true
	validates :length, presence: true, numericality: true
	validates :width, presence: true, numericality: true
	validates :delday, presence: true, numericality: true, inclusion: {in: 1..31, message: "Enter valid date" }
	validates :delmonth, presence: true, inclusion: { in: %w(January February March April May June July August September October November December),
													message: "Enter valid month name"}
	validates :delyear, presence: true, numericality: {greater_than_or_equal_to: 2015, message: "Enter valid year" }
	mount_uploader :picture, PictureUploader
	validate :picture_size
	default_scope -> { order(updated_at: :desc) }


	def self.search(search)
		if search
			where(["title LIKE ?", "%#{search}%"])
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