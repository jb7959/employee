class CreateServiceCharges < ActiveRecord::Migration
  def change
    create_table :service_charges do |t|
      t.string :emp_id
      t.integer :charge
      t.date :date

      t.timestamps
    end
  end
end
