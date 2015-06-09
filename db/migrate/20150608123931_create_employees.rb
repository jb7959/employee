class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.text :adress
      t.string :payment_type
      t.integer :salary
      t.integer :hourly_rate
      t.float :commision_rate
      t.string :Affiliation_type
      t.string :Dues
      t.string :payment_method_type
      t.string :bank_name
      t.string :bank_account
      t.string :mail_address

      t.timestamps
    end
  end
end
