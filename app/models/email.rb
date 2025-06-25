class Email < ApplicationRecord
  belongs_to :email_group

  validates :subject, :body, presence: true
end
