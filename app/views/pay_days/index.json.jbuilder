json.array!(@pay_days) do |pay_day|
  json.extract! pay_day, :id, :emp_id, :name, :payment_type, :pay, :lastPayday
  json.url pay_day_url(pay_day, format: :json)
end
