require 'rails_helper'

RSpec.describe User do
  describe "associations" do
    it { should have_many(:email_group_memberships).dependent(:destroy) }
    it { should have_many(:email_groups).through(:email_group_memberships) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:email) }
  end
end
