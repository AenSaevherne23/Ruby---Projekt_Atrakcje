class CreateCities < ActiveRecord::Migration[7.1]
  def change
    create_table :cities do |t|
      t.string :name_city
      t.integer :population
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
