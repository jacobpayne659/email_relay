class CreateGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :group_email
      t.integer :message_count

      t.timestamps
    end
  end
end
