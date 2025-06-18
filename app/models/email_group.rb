class EmailGroup < ApplicationRecord
  has_many :email_group_memberships, dependent: :destroy
  has_many :users, through: :email_group_memberships
  has_many :emails, dependent: :destroy

  validates :name, presence: true
  validates :group_email, presence: true, uniqueness: true
end
