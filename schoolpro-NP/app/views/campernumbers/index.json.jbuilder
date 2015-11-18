json.array!(@campernumbers) do |campernumber|
  json.extract! campernumber, :id, :park_name, :jan, :feb, :mar, :apr, :may, :jun, :jul, :aug, :sep, :oct, :nov, :dec
  json.url campernumber_url(campernumber, format: :json)
end
