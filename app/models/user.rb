class User < ApplicationRecord
  has_many :email_group_memberships, dependent: :destroy
  has_many :email_groups, through: :email_group_memberships

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
