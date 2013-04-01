class AddColumnCreatedAtMillToTexts < ActiveRecord::Migration
  # def change
  def self.up
    
    add_column :texts, :created_at_mill, :integer, :default => 0, :null => false

  end
  
  def self.down
    
    remove_column :texts, :created_at_mill
    
  end
end
