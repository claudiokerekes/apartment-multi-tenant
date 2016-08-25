class RemoveCampoToProduct < ActiveRecord::Migration
  def change
    remove_column :products, :campo
  end
end
