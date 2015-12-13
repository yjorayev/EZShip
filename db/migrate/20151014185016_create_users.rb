class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :firstname
    	t.string :lastname
    	t.string :email
    	t.string :phone
    	t.string :role, default: "Customer"
    	t.integer :rating, default: 0
    	t.timestamps
    end
  end
end
