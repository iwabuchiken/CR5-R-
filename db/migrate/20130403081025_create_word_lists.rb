class CreateWordLists < ActiveRecord::Migration
  def self.up
    create_table :word_lists do |t|
      t.integer :text_id
      t.integer :word_id
      t.integer :lang_id

      t.timestamps
    end
  end
  
  def self.down
    
    drop_table :word_lists
    
  end
end#class CreateWordLists
