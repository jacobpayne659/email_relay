class DropGroupMemberTable < ActiveRecord::Migration[8.0]
  def up
    drop_table :group_members, if_exists: true do |t|
      t.references :group, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true
      t.string :role
      t.timestamps
    end
  end

  def down
    create_table :group_members do |t|
      t.references :group, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true
      t.string :role
      t.timestamps
    end
  end
end
