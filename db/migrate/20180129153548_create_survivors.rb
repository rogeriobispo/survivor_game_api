class CreateSurvivors < ActiveRecord::Migration[5.0]
  def change
    create_table :survivors do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :last_latitude
      t.string :last_longitude

      t.timestamps
    end
  end
end
