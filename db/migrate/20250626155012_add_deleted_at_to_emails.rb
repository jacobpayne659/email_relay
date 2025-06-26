class AddDeletedAtToEmails < ActiveRecord::Migration[8.0]
  def change
    add_column :emails, :deleted_at, :datetime
  end
end
