class ChangeColumnCreatedAtMillTextxBigInt < ActiveRecord::Migration
  def self.up
    
    change_column :texts, :created_at_mill, :bigint, :default => 0, :null => false
    
  end

  def self.down
    
    change_column :texts, :created_at_mill, :integer, :default => 0, :null => false
    
  end
end
