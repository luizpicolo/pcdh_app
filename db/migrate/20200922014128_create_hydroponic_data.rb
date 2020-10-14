class CreateHydroponicData < ActiveRecord::Migration[6.0]
  def change
    create_table :hydroponic_data do |t|
      t.string :temperature
      t.string :humidity
      t.string :waterflow
      t.string :ph
      t.string :ce
      t.references :hydroponic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
