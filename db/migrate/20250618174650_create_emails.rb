class CreateEmails < ActiveRecord::Migration[8.0]
  def change
    create_table :emails do |t|
      t.references :group, null: false, foreign_key: true
      t.string :subject
      t.text :body
      t.string :from_address
      t.datetime :received_at

      t.timestamps
    end
  end
end
