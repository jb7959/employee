class AddUnionIdToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :union_id, :string
  end
end
