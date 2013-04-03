class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :w1
      t.string :w2
      t.string :w3
      t.integer :text_id
      t.string :text_ids
      t.integer :lang_id

      t.timestamps
    end
  end
end
