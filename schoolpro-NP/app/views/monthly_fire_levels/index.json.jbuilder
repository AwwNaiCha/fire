json.array!(@monthly_fire_levels) do |monthly_fire_level|
  json.extract! monthly_fire_level, :id, :park_name, :jan, :feb, :mar, :apr, :may, :jun, :jul, :aug, :sep, :oct, :nov, :dec
  json.url monthly_fire_level_url(monthly_fire_level, format: :json)
end
