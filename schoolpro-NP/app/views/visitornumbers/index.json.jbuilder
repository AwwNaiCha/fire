json.array!(@visitornumbers) do |visitornumber|
  json.extract! visitornumber, :id, :park_name, :jan, :feb, :mar, :apr, :may, :jun, :jul, :aug, :sep, :oct, :nov, :dec
  json.url visitornumber_url(visitornumber, format: :json)
end
