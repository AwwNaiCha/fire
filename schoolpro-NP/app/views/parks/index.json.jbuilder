json.array!(@parks) do |park|
  json.extract! park, :id, :park_name, :state
  json.url park_url(park, format: :json)
end
