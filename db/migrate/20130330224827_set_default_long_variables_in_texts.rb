#REF=> http://stackoverflow.com/questions/1186400/correct-way-to-set-default-values-in-rails
class SetDefaultLongVariablesInTexts < ActiveRecord::Migration
  def up
    # change_column :texts, :dbId, :default => 0
    change_column :texts, :dbId, :integer, :default => 0
  end

  def down
    print "[", __FILE__, ":", __LINE__, "]"
    raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end
end
