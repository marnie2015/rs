json.extract! payment, :id, :or_date, :or_number, :reservation_id, :remarks, :created_at, :updated_at
json.url payment_url(payment, format: :json)
