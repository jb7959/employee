class CreateTimeCards < ActiveRecord::Migration
  def change
    create_table :time_cards do |t|
      t.string :emp_id
      t.date :date
      t.integer :time

      t.timestamps
    end
  end
end
