require "test_helper"

class ShipmentTest < ActiveSupport::TestCase
	def setup
		@user = User.create(firstname: "JAY", lastname: "LEE", email: "ljh@gmail.com",
            phone: "334-372-4956", role: "Carrier", rating: 4)
		@shipment = @user.shipments.build(title: "bag", pcountry: "USA", pstate: "AL", pcity: "Troy", paddress: "5 a str",
		 pzipcode: 36081, dcountry: "USA", dstate: "KS", dcity: "Kansas City", daddress: "4 bgg str", dzipcode: 24015,
		  weight: 2.5, heigth: 5.2, width: 4.6, length: 2.5, delday: 15, delmonth: "January", delyear: 2016)
	end

	test "Shipment should be valid" do
		assert @shipment.valid?
	end

	test "User id should be present" do
		@shipment.user_id = nil
		assert_not @shipment.valid?
	end

	test "title should be present" do
		@shipment.title = " "
		assert_not @shipment.valid?
	end

	test "title length should not be too short" do
		@shipment.title = "a"
		assert_not @shipment.valid?
	end

	test "title length should not be too long" do
		@shipment.title = "a" * 31
		assert_not @shipment.valid?
	end

	test "pickup country should be present" do
		@shipment.pcountry = " "
		assert_not @shipment.valid?
	end

	test "pickup state should be present" do
		@shipment.pstate = " "
		assert_not @shipment.valid?
	end

	test "pickup city should be present" do
		@shipment.pcity = " "
		assert_not @shipment.valid?
	end

	test "pickup address should be present" do
		@shipment.paddress = " "
		assert_not @shipment.valid?
	end

	test "pickup zipcode should be present" do
		@shipment.pzipcode = " "
		assert_not @shipment.valid?
	end

	test "dropoff country should be present" do
		@shipment.dcountry = " "
		assert_not @shipment.valid?
	end

	test "dropoff state should be present" do
		@shipment.dstate = " "
		assert_not @shipment.valid?
	end

	test "dropoff city should be present" do
		@shipment.dcity = " "
		assert_not @shipment.valid?
	end

	test "dropoff address should be present" do
		@shipment.daddress = " "
		assert_not @shipment.valid?
	end

	test "dropoff zipcode should be present" do
		@shipment.dzipcode = " "
		assert_not @shipment.valid?
	end


	test "weight should be present" do
		@shipment.weight = " "
		assert_not @shipment.valid?
	end
		  
	test "heigth should be present" do
		@shipment.heigth = " "
		assert_not @shipment.valid?
	end
		  
		  
	test "length should be present" do
		@shipment.length = " "
		assert_not @shipment.valid?
	end
		
    test "width should be present" do
		@shipment.width = " "
		assert_not @shipment.valid?
	end
		  
	test "delday should be present" do
		@shipment.delday = " "
		assert_not @shipment.valid?
	end
		  
	test "delmonth should be present" do
		@shipment.delmonth = " "
		assert_not @shipment.valid?
	end

	test "delyear should be present" do
		@shipment.delyear = " "
		assert_not @shipment.valid?
	end


end 
