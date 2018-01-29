class Survivor < ApplicationRecord
  validates :name, :age, :gender,
            :last_longitude, :last_latitude, presence: true
end
