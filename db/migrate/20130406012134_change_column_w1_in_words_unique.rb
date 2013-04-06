class ChangeColumnW1InWordsUnique < ActiveRecord::Migration
  def up
    #REF=> http://stackoverflow.com/questions/1449459/how-to-make-column-unique-and-index-it-in-rails-migration
    change_column :words, :w1, :unique => true
    
  end

  def down
    
    change_column :words, :w1, :unique => false
    
  end
end
