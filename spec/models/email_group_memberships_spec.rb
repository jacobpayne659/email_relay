require 'rails_helper'

RSpec.describe EmailGroupMembership do
  describe "associations" do
    it { should belong_to(:email_group) }
    it { should belong_to(:user) }
  end
end
