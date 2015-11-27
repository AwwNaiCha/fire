json.array!(@monthly_prcps) do |monthly_prcp|
  json.extract! monthly_prcp, :id, :park_name, :jan, :feb, :mar, :apr, :may, :jun, :jul, :aug, :sep, :oct, :nov, :dec
  json.url monthly_prcp_url(monthly_prcp, format: :json)
end
