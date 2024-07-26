class Grade < ApplicationRecord
  belongs_to :attraction
  belongs_to :user
end
