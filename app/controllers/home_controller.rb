class HomeController < ApplicationController
  def index
    @reservations = Reservation.all
  end
end
