class CreatePayDays < ActiveRecord::Migration
  def change
    create_table :pay_days do |t|
      t.string :emp_id
      t.string :name
      t.string :payment_type
      t.integer :pay
      t.date :lastPayday

      t.timestamps
    end
  end
end
