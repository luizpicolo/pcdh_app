class CreateHydroponics < ActiveRecord::Migration[6.0]
  def change
    create_table :hydroponics do |t|
      t.string :identifier, null: false
      t.string :token
      t.references :greenhouse, null: false, foreign_key: true

      t.timestamps
    end
  end
end
