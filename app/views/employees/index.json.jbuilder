json.array!(@employees) do |employee|
  json.extract! employee, :id, :name, :adress, :payment_type, :salary, :hourly_rate, :commision_rate, :Affiliation_type, :Dues, :payment_method_type, :bank_name, :bank_account, :mail_address
  json.url employee_url(employee, format: :json)
end
