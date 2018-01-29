class Addvalidationnotnulltosurvivors < ActiveRecord::Migration[5.0]
  def change
      change_column(:survivors, :name, :string, null: false)
      change_column(:survivors, :age, :integer, null: false)
      change_column(:survivors, :gender, :string, null: false)
      change_column(:survivors, :last_longitude, :string, null: false)
      change_column(:survivors, :last_latitude, :string, null: false)
  end
end
