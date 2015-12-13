class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
    	t.string :icountry
        t.string :istate
        t.string :icity
        t.string :iaddress
        t.integer :izipcode
    	t.string :fcountry
        t.string :fstate
        t.string :fcity
        t.string :faddress
        t.integer :fzipcode
    	t.integer :day
    	t.string :month
    	t.integer :year
    	t.integer :maxweight
    	t.integer :maxheigth
    	t.integer :maxwidth
    	t.integer :maxlength
    	t.timestamps
    end
  end
end
