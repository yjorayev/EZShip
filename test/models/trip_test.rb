require "test_helper"

class TripTest < ActiveSupport::TestCase
	def setup
		@user = User.create(firstname: "JAY", lastname: "LEE", email: "ljh@gmail.com",
            phone: "334-372-4956", role: "Carrier", rating: 4)
		@trip = @user.trips.build(icountry: "USA", istate: "NY", icity: "New York", iaddress: "123 25th ave", izipcode: 12027, 
			fcountry: "USA", fstate: "VA", fcity: "Richmond", faddress: "12 palm str", fzipcode: 15527,
			day: 24, month: "November", year: 2015, maxweight: 4, maxheigth: 25, maxwidth: 80, maxlength: 130)
	end

	test "Trip should be right" do
		assert @trip.valid?
	end

	test "User id should be present" do
		@trip.user_id = nil
		assert_not @trip.valid?
	end

	test "Country should be present" do
		@trip.icountry = " "
		assert_not @trip.valid?
	end

	test "State should be present" do
		@trip.istate = " "
		assert_not @trip.valid?
	end


	test "City should be present" do
		@trip.icity = " "
		assert_not @trip.valid?
	end


	test "Address should be present" do
		@trip.iaddress = " "
		assert_not @trip.valid?
	end

	test "Zipcode should be present" do
		@trip.izipcode = " "
		assert_not @trip.valid?
	end



	test "Drop off Country should be present" do
		@trip.fcountry = " "
		assert_not @trip.valid?
	end

	test "Drop off State should be present" do
		@trip.fstate = " "
		assert_not @trip.valid?
	end


	test "Drop off City should be present" do
		@trip.fcity = " "
		assert_not @trip.valid?
	end


	test "Drop off Address should be present" do
		@trip.faddress = " "
		assert_not @trip.valid?
	end

	test "Drop off Zipcode should be present" do
		@trip.fzipcode = " "
		assert_not @trip.valid?
	end

	test "Day should be present" do
		@trip.day = " "
		assert_not @trip.valid?
	end

	test "Month should be present" do
		@trip.month = " "
		assert_not @trip.valid?
	end
	test "Year should be present" do
		@trip.year = " "
		assert_not @trip.valid?
	end

	test "Max weight should be present" do
		@trip.maxweight = " "
		assert_not @trip.valid?
	end

	test "Max height should be present" do
		@trip.maxheigth = " "
		assert_not @trip.valid?
	end

	test "Max width should be present" do
		@trip.maxwidth = " "
		assert_not @trip.valid?
	end

	test "Max length should be present" do
		@trip.maxlength = " "
		assert_not @trip.valid?
	end

end