json.array!(@weathers) do |weather|
  json.extract! weather, :id, :park_name, :date, :temp, :precip, :wind, :humidity
  json.url weather_url(weather, format: :json)
end
