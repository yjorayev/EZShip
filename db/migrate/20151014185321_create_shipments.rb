class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
    	t.string :title
    	t.string :pcountry
        t.string :pstate
        t.string :pcity
        t.string :paddress
        t.integer :pzipcode
    	t.string :dcountry
        t.string :dstate
        t.string :dcity
        t.string :daddress
        t.integer :dzipcode
    	t.float :weight
    	t.float :heigth
    	t.float :width
    	t.float :length
    	t.integer :delday
    	t.string :delmonth
    	t.integer :delyear
    	t.timestamps 
    end
  end
end