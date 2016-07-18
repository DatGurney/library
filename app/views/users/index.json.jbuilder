json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :date_of_birth, :email, :address_line1, :address_line2, :address_city, :address_country, :address_postcode
  json.url user_url(user, format: :json)
end
