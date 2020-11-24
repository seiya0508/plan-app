class Garbage < ApplicationRecord
  belongs_to :user
  validates :dow, presence: true
  validates :title, presence: true
end
