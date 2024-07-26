class Attraction < ApplicationRecord
  belongs_to :city
  has_many :grades
  has_many :users, through: :grades
end
