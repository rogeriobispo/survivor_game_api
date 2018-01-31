class AddInventoryReferencesToSurvivor < ActiveRecord::Migration[5.0]
  def change
    add_reference :survivors, :inventory, foreign_key: true
  end
end
