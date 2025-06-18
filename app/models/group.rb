class EmailGroup < ApplicationRecord
  has_many :group_members, dependent: :destroy
  has_many :members, through: :group_members
  has_many :emails, dependent: :destroy

  validates :name, presence: true
  validates :group_email, presence: true, uniqueness: true
end
