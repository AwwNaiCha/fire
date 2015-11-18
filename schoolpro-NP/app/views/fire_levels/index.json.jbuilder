json.array!(@fire_levels) do |fire_level|
  json.extract! fire_level, :id, :park_name, :date, :level
  json.url fire_level_url(fire_level, format: :json)
end
