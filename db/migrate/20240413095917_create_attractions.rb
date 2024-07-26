class CreateAttractions < ActiveRecord::Migration[7.1]
  def change
    create_table :attractions do |t|
      t.string :name_attraction
      t.string :category
      t.text :description
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
