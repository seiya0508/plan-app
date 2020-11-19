class Garbage < ApplicationRecord
  validates :dow, presence: true
  validates :title, presence: true
end
