class Reservation < ApplicationRecord
  belongs_to :client
  before_save :update_start_time

  def update_start_time
    self.start_time = self.reservation_date
  end
end
