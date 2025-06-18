class RenameGroupIdToEmailGroupId < ActiveRecord::Migration[8.0]
  def up
    rename_column :group_members, :group_id, :email_group_id
    rename_column :emails, :group_id, :email_group_id
  end

  def down
    rename_column :group_members, :email_group_id, :group_id
    rename_column :emails, :email_group_id, :group_id
  end
end
