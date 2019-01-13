class Admin::ReservationsController < Admin::ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def index
    @reservations = Reservation.all
  end

  def show
    @payments = Payment.where(reservation_id: @reservation.id)
  end

  def new
    @reservation = Reservation.new
  end

  def edit
  end

  def create
    @client = Client.new(client_params)
    @reservation = Reservation.new(reservation_params)
    @client.save
    @reservation.client_id = @client.id

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to admin_reservations_path, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    Client.find(@reservation.client_id).update(edit_client_params) if params[:table] == 'client'
    @reservation.update(edit_reservation_params)  if params[:table] == 'reservation'
    render inline: 'Successfully saved!'
  end

  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:reservation_date, :reservation_time, :package, :amount, :status, :client_id, :place_of_church, :place_of_coverage, :reception, :recommended_by, :tape, :coverage, :album, :motif, :excess_shots, :free)
  end

  def edit_reservation_params
    params.permit(:reservation_date, :reservation_time, :package, :amount, :status, :client_id, :place_of_church, :place_of_coverage, :reception, :recommended_by, :tape, :coverage, :album, :motif, :excess_shots, :free)
  end

  def client_params
    params.require(:client).permit(:fname, :mname, :lname, :contact)
  end

  def edit_client_params
    params.permit(:fname, :mname, :lname, :contact)
  end
end
