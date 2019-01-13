json.extract! reservation, :id, :reservation_date, :reservation_time, :package, :amount, :status, :client_id, :place_of_church, :place_of_coverage, :reception, :recommended_by, :tape, :coverage, :album, :motif, :excess_shots, :free, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
