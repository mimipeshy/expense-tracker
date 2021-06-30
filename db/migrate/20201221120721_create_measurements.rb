class CreateMeasurements < ActiveRecord::Migration[6.1]
  def change
    create_table :measurements do |t|
      t.integer :amount
      t.date :date
      t.references :expense, null: false, foreign_key: true

      t.timestamps
    end
  end
end