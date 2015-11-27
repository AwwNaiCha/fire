json.array!(@montly_temps) do |montly_temp|
  json.extract! montly_temp, :id, :park_name, :jan, :feb, :mar, :apr, :may, :jun, :jul, :aug, :sep, :oct, :nov, :dec
  json.url montly_temp_url(montly_temp, format: :json)
end
