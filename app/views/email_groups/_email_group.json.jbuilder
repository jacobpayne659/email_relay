json.extract! email_group, :id, :name, :group_email, :message_count, :created_at, :updated_at
json.url email_group_url(email_group, format: :json)
