class CreateCitiesUsersJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :cities, :users do |t|
  end
  end
end
