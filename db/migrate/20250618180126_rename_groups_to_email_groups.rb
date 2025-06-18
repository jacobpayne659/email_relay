class RenameGroupsToEmailGroups < ActiveRecord::Migration[8.0]
  def up
    rename_table :groups, :email_groups
  end

  def down
    rename_table :email_groups, :groups
  end
end
