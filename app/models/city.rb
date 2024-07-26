class City < ApplicationRecord
  belongs_to :country
  has_many :attractions
  has_and_belongs_to_many :users
end
