class Survivor < ApplicationRecord
  validates :name, :age, :gender, :contaminated,
            :last_longitude, :last_latitude, presence: true
  def add_contaminated_point
    self.contaminated += 1
    turn_into_zumbie
  end

  private

  def turn_into_zumbie
    self.zumbie = true if self.contaminated >= 3
  end
end
