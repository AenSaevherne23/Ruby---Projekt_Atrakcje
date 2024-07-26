class CreateJoinTableAttractionUser < ActiveRecord::Migration[7.1]
  def change
    create_join_table :attractions, :users, primary_key: [:attraction_id, :user_id] do |t|
      # t.references :attraction, null: false, foreign_key: true
      # t.references :user, null: false, foreign_key: true
    end
  end
end
