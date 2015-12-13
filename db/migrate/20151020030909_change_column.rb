class ChangeColumn < ActiveRecord::Migration
  def change
  	change_column :users, :role, :string, :default => "Customer"
  	change_column :users, :rating, :integer, :default => 0
  end
end
