json.array!(@people) do |person|
  json.extract! person, :name, :email, :birthdate, :bio
  json.url person_url(person, format: :json)
end