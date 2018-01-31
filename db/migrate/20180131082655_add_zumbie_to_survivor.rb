class AddZumbieToSurvivor < ActiveRecord::Migration[5.0]
  def change
    add_column :survivors, :zumbie, :boolean, default: false
  end
end
