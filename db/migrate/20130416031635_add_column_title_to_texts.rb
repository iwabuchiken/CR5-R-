class AddColumnTitleToTexts < ActiveRecord::Migration

  def self.up
    
    add_column :texts, :title, :string

  end

  def self.down
    
    remove_column :texts, :title

  end
end
