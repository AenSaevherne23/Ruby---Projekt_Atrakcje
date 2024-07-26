class User < ApplicationRecord
  has_and_belongs_to_many :cities
  has_many :grades
  has_many :attractions, through: :grades
end
