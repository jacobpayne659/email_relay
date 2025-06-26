require 'rails_helper'

RSpec.describe EmailGroup do
  describe "associations" do
    it { should have_many(:email_group_memberships).dependent(:destroy) }
    it { should have_many(:users).through(:email_group_memberships) }
    it { should have_many(:emails).dependent(:destroy) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:group_email) }
    it { should validate_uniqueness_of(:group_email) }
  end
end
