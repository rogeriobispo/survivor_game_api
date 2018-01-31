class AddContaminatedToSurvivor < ActiveRecord::Migration[5.0]
  def change
    add_column :survivors, :contaminated, :integer, null: false, default: 0
  end
end
