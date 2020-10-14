class CreateGreenhouses < ActiveRecord::Migration[6.0]
  def change
    create_table :greenhouses do |t|
      t.string :identifier
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
