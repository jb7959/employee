#employees 테이블내의 Dues 컬럼의 데이터타입을 string에서 integer로 바꿈. 기본값 0 
class ChangeDataTypeForEmployees < ActiveRecord::Migration
   def self.up
    change_table :employees do |t|
      t.change :Dues, :integer, default: 0 
    end
  end
  def self.down
    change_table :employees do |t|
      t.change :Dues, :string
    end
  end
end