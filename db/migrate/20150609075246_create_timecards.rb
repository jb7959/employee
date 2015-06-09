class CreateTimecards < ActiveRecord::Migration
  def change
    create_table :timecards do |t|
      t.string :emp_id
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
