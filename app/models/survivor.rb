class Survivor < ApplicationRecord
  validates :name, :age, :gender, presence: true
  validates :last_longitude, :last_latitude, presence: true
end
