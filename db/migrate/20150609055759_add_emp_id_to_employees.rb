class AddEmpIdToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :emp_id, :string
  end
end
