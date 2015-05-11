json.array!(@users) do |user|
  json.extract! user, :id, :login, :full_name, :email, :age
  json.url user_url(user, format: :json)
end
