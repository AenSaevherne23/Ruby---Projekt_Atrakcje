class AddGradeToAttractionUser < ActiveRecord::Migration[7.1]
  def change
    rename_table 'attractions_users', 'grades'
    add_column :grades, :grade, :decimal, precision: 4, scale: 1
  end
end
