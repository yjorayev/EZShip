class AddPictureToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :picture, :string
  end
end
