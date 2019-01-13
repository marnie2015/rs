require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservation = reservations(:one)
  end

  test "should get index" do
    get reservations_url
    assert_response :success
  end

  test "should get new" do
    get new_reservation_url
    assert_response :success
  end

  test "should create reservation" do
    assert_difference('Reservation.count') do
      post reservations_url, params: { reservation: { album: @reservation.album, amount: @reservation.amount, client_id: @reservation.client_id, coverage: @reservation.coverage, excess_shots: @reservation.excess_shots, free: @reservation.free, motif: @reservation.motif, package: @reservation.package, place_of_church: @reservation.place_of_church, place_of_coverage: @reservation.place_of_coverage, reception: @reservation.reception, recommended_by: @reservation.recommended_by, reservation_date: @reservation.reservation_date, reservation_time: @reservation.reservation_time, status: @reservation.status, tape: @reservation.tape } }
    end

    assert_redirected_to reservation_url(Reservation.last)
  end

  test "should show reservation" do
    get reservation_url(@reservation)
    assert_response :success
  end

  test "should get edit" do
    get edit_reservation_url(@reservation)
    assert_response :success
  end

  test "should update reservation" do
    patch reservation_url(@reservation), params: { reservation: { album: @reservation.album, amount: @reservation.amount, client_id: @reservation.client_id, coverage: @reservation.coverage, excess_shots: @reservation.excess_shots, free: @reservation.free, motif: @reservation.motif, package: @reservation.package, place_of_church: @reservation.place_of_church, place_of_coverage: @reservation.place_of_coverage, reception: @reservation.reception, recommended_by: @reservation.recommended_by, reservation_date: @reservation.reservation_date, reservation_time: @reservation.reservation_time, status: @reservation.status, tape: @reservation.tape } }
    assert_redirected_to reservation_url(@reservation)
  end

  test "should destroy reservation" do
    assert_difference('Reservation.count', -1) do
      delete reservation_url(@reservation)
    end

    assert_redirected_to reservations_url
  end
end
