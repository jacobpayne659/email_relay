class Email < ApplicationRecord
  belongs_to :email_group

  scope :active, -> { where(deleted_at: nil) }

  validates :subject, :body, presence: true
end
