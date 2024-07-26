class CreateCountries < ActiveRecord::Migration[7.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :capital
      t.integer :area

      t.timestamps
    end
  end
end
