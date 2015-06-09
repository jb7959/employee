class CreateSalesReceipts < ActiveRecord::Migration
  def change
    create_table :sales_receipts do |t|
      t.integer :employees_id
      t.integer :date
      t.integer :amount

      t.timestamps
    end
  end
end
