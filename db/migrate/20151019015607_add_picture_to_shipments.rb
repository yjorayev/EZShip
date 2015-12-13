class AddPictureToShipments < ActiveRecord::Migration
  def change
    add_column :shipments, :picture, :string
  end
end
