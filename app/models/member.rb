class Member < ApplicationRecord
  has_many :group_members, dependent: :destroy
  has_many :groups, through: :group_members

  validates :email, presence: true, uniqueness: true
end
