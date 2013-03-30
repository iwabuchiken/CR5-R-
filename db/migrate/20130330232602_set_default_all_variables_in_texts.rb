class SetDefaultAllVariablesInTexts < ActiveRecord::Migration
  def up
    change_column :texts, :genre_id, :integer, :null => false
    change_column :texts, :subgenre_id, :integer, :null => false
    change_column :texts, :lang_id, :integer, :null => false
  end

  def down
    print "[", __FILE__, ":", __LINE__, "]"
    raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end
end
