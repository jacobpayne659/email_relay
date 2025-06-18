class EmailGroupMembership < ApplicationRecord
  belongs_to :email_group
  belongs_to :user
end
