class AddCampoToProduct < ActiveRecord::Migration
  def change
    add_column :products, :campo, :decimal
  end
end
