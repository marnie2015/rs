json.extract! user, :id, :email, :password_digest, :reset_password_token, :role, :created_at, :updated_at
json.url user_url(user, format: :json)
