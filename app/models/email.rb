class Email < ApplicationRecord
  belongs_to :email_group

  validates :subject, :body, :from_address, :received_at, presence: true
end
