json.extract! user, :id, :name_user, :email, :password, :created_at, :updated_at
json.url user_url(user, format: :json)
