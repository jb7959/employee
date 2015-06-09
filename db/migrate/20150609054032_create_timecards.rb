class CreateTimecards < ActiveRecord::Migration
  def change
    create_table :timecards do |t|
      t.integer :employees_id
      t.integer :date
      t.integer :time

      t.timestamps
    end
  end
end
