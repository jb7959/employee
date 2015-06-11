class CreateSalesReceipts < ActiveRecord::Migration
  def change
    create_table :sales_receipts do |t|
      t.string :emp_id
      t.integer :amount
      t.date :date

      t.timestamps
    end
  end
end
