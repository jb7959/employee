class CreateCalculatePays < ActiveRecord::Migration
  def change
    create_table :calculate_pays do |t|
      t.string :emp_id
      t.integer :pay

      t.timestamps
    end
  end
end
