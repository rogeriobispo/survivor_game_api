class Survivor < ApplicationRecord
  has_one :inventory

  after_create :create_inventory
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

  def create_inventory
    Inventory.create(survivor: self)
  end
end
