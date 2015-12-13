class Trip < ActiveRecord::Base
	belongs_to :user
	validates :user_id , presence: true
	validates :icountry, presence: true
    validates :istate, presence: true
    validates :icity, presence: true
    validates :iaddress, presence: true
    validates :izipcode, presence: true, numericality: true
	validates :fcountry, presence: true
    validates :fstate, presence: true
    validates :fcity, presence: true
    validates :faddress, presence: true
    validates :fzipcode, presence: true, numericality: true
	validates :day, presence: true, numericality: true, inclusion: {in: 1..31, message: "Enter valid date" }
	validates :month, presence: true, inclusion: { in: %w(January February March April May June July August September October November December),
													message: "Enter valid month name"}
	validates :year, presence: true, numericality: true, numericality: {greater_than_or_equal_to: 2015, message: "Enter valid year" }
	validates :maxweight, presence: true, numericality: true
	validates :maxheigth, presence: true, numericality: true
	validates :maxwidth, presence: true, numericality: true
	validates :maxlength, presence: true, numericality: true
	default_scope -> { order(updated_at: :desc) }


	def self.search(search)
		if search
			where(["icountry LIKE ? OR istate LIKE ? OR icity LIKE ? OR fcountry LIKE ? OR fcity LIKE ? OR fstate LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
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