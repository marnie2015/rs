class ReservationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def create
    @client = Client.new(client_params)
    @reservation = Reservation.new(reservation_params)
    @client.save
    @reservation.client_id = @client.id
    @reservation.amount = reservation_params[:amount]
    @reservation.status = 'PENDING'

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to '/reservations', notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render inline: 'error' }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def reservation_params
    params.require(:reservation)
          .permit(:reservation_date, :reservation_time,
                  :package, :amount, :status, :client_id, :place_of_church,
                  :place_of_coverage, :reception, :recommended_by, :tape,
                  :coverage, :album, :motif, :excess_shots, :free)
  end

  def client_params
    params.require(:client).permit(:fname, :mname, :lname, :contact)
  end
end
