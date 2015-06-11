json.array!(@sales_receipts) do |sales_receipt|
  json.extract! sales_receipt, :id, :emp_id, :amount, :date
  json.url sales_receipt_url(sales_receipt, format: :json)
end
