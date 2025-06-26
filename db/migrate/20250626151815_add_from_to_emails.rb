class AddFromToEmails < ActiveRecord::Migration[8.0]
  def change
    add_column :emails, :from, :string
  end
end
