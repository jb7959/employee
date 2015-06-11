json.array!(@service_charges) do |service_charge|
  json.extract! service_charge, :id, :emp_id, :charge, :date
  json.url service_charge_url(service_charge, format: :json)
end
