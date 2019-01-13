json.extract! client, :id, :fname, :mname, :lname, :contact, :created_at, :updated_at
json.url client_url(client, format: :json)
