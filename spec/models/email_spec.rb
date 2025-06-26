require 'rails_helper'

RSpec.describe Email, type: :model do
  describe "associations" do
    it { should belong_to(:email_group) }
  end

  describe "validations" do
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:body) }
  end

  describe "scopes" do
    describe ".active" do
      let!(:active_email) { create(:email, deleted_at: nil) }
      let!(:deleted_email) { create(:email, deleted_at: Time.current) }

      it "returns only emails that are not soft deleted" do
        expect(Email.active).to include(active_email)
        expect(Email.active).not_to include(deleted_email)
      end
    end
  end
end
