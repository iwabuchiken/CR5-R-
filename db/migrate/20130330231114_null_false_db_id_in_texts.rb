class NullFalseDbIdInTexts < ActiveRecord::Migration
  def up
    change_column :texts, :dbId, :integer, :null => false
  end

  def down
    print "[", __FILE__, ":", __LINE__, "]"
    raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end
end
