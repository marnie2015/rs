require "application_system_test_case"

class ReservationsTest < ApplicationSystemTestCase
  setup do
    @reservation = reservations(:one)
  end

  test "visiting the index" do
    visit reservations_url
    assert_selector "h1", text: "Reservations"
  end

  test "creating a Reservation" do
    visit reservations_url
    click_on "New Reservation"

    fill_in "Album", with: @reservation.album
    fill_in "Amount", with: @reservation.amount
    fill_in "Client", with: @reservation.client_id
    fill_in "Coverage", with: @reservation.coverage
    fill_in "Excess Shots", with: @reservation.excess_shots
    fill_in "Free", with: @reservation.free
    fill_in "Motif", with: @reservation.motif
    fill_in "Package", with: @reservation.package
    fill_in "Place Of Church", with: @reservation.place_of_church
    fill_in "Place Of Coverage", with: @reservation.place_of_coverage
    fill_in "Reception", with: @reservation.reception
    fill_in "Recommended By", with: @reservation.recommended_by
    fill_in "Reservation Date", with: @reservation.reservation_date
    fill_in "Reservation Time", with: @reservation.reservation_time
    fill_in "Status", with: @reservation.status
    fill_in "Tape", with: @reservation.tape
    click_on "Create Reservation"

    assert_text "Reservation was successfully created"
    click_on "Back"
  end

  test "updating a Reservation" do
    visit reservations_url
    click_on "Edit", match: :first

    fill_in "Album", with: @reservation.album
    fill_in "Amount", with: @reservation.amount
    fill_in "Client", with: @reservation.client_id
    fill_in "Coverage", with: @reservation.coverage
    fill_in "Excess Shots", with: @reservation.excess_shots
    fill_in "Free", with: @reservation.free
    fill_in "Motif", with: @reservation.motif
    fill_in "Package", with: @reservation.package
    fill_in "Place Of Church", with: @reservation.place_of_church
    fill_in "Place Of Coverage", with: @reservation.place_of_coverage
    fill_in "Reception", with: @reservation.reception
    fill_in "Recommended By", with: @reservation.recommended_by
    fill_in "Reservation Date", with: @reservation.reservation_date
    fill_in "Reservation Time", with: @reservation.reservation_time
    fill_in "Status", with: @reservation.status
    fill_in "Tape", with: @reservation.tape
    click_on "Update Reservation"

    assert_text "Reservation was successfully updated"
    click_on "Back"
  end

  test "destroying a Reservation" do
    visit reservations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reservation was successfully destroyed"
  end
end
