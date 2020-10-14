class Greenhouse < ApplicationRecord
  belongs_to :user
  has_many :hydroponics
end
