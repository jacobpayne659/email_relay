require 'rails_helper'

RSpec.describe EmailGroupMailbox do
  let(:group_email) { "example@email.com" }
  let(:mail) do
    Mail.new(
      to: group_email,
      from: "sender@example.com",
      subject: "Hello Group",
      body: "This is a test email"
    )
  end

  let!(:email_group) { EmailGroup.create!(name: "Example Group", group_email: "example@email.com") }
  let!(:user1) { User.create!(name: "user1", email: "user1@email.com") }
  let!(:user2) { User.create!(name: "user2", email: "user2@email.com") }

  let(:inbound_email) { ActionMailbox::InboundEmail.create_and_extract_message_id!(mail.to_s) }
  let(:mailbox) { EmailGroupMailbox.new(inbound_email) }

  subject { mailbox.process }

  describe "#process" do
    context "when EmailGroup exists" do
      it "creates an Email record linked to the group" do
        expect { subject }.to change { Email.count }.by(1)
        email = Email.last
        expect(email.subject).to eq(mail.subject)
        expect(email.body).to eq(mail.decoded)
        expect(email.email_group).to eq(email_group)
      end

      it "forwards the email to each user in the group" do
        email_group.users << [user1, user2]
        ActionMailer::Base.deliveries.clear

        subject

        expect(ActionMailer::Base.deliveries.size).to eq(2)

        recipients = ActionMailer::Base.deliveries.map(&:to).flatten
        expect(recipients).to include("user1@email.com", "user2@email.com")

        delivered_email = ActionMailer::Base.deliveries.first
        expect(delivered_email.subject).to eq("Hello Group")
        expect(delivered_email.body.encoded).to include("This is a test email")
      end
    end

    context "when EmailGroup does not exist" do
      let(:group_email) { "nonexistent@email.com" }

      it "does not create an Email record" do
        expect { subject }.not_to change { Email.count }
      end
    end
  end
end
