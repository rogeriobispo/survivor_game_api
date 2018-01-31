class AddSurvivorReferenceToInventory < ActiveRecord::Migration[5.0]
  def change
    add_reference :inventories, :survivor, foreign_key: true
  end
end
