json.array!(@sales_receipts) do |sales_receipt|
  json.extract! sales_receipt, :id, :employees_id, :date, :amount
  json.url sales_receipt_url(sales_receipt, format: :json)
end
