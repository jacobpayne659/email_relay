class DropMemberTable < ActiveRecord::Migration[8.0]
  def up
    drop_table :members, if_exists: true do |t|
      t.string :name
      t.string :email
      t.string :role
      t.timestamps
    end
  end

  def down
    create_table :members do |t|
      t.string :name
      t.string :email
      t.string :role
      t.timestamps
    end
  end
end
