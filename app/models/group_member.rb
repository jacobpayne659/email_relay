class GroupMember < ApplicationRecord
  belongs_to :email_group
  belongs_to :member
end
