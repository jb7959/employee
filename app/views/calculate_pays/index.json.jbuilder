json.array!(@calculate_pays) do |calculate_pay|
  json.extract! calculate_pay, :id, :emp_id, :pay
  json.url calculate_pay_url(calculate_pay, format: :json)
end
