require 'rails_helper'

RSpec.describe EmailGroupMailbox do
  let(:group_email) { "designers@email.com" }
  let(:mail) do
    Mail.new(
      to: group_email,
      subject: "Hello Group",
      body: "This is a test email",
    )
  end

  let!(:email_group) { EmailGroup.create!(name: "Example Group", group_email: group_email) }
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

      it "forwards email to all users via GroupMailer" do
        email_group.users.each do |user|
          expect(GroupMailer).to receive(:forward_email).with(user, mailbox.mail).and_return(double(deliver_later: true))
        end
        mailbox.process
      end
    end

    context "when an exception is raised" do
      before do
        allow(EmailGroup).to receive(:find_by).and_raise(StandardError, "boom!")
      end

      it "logs error and raises" do
        expect(Rails.logger).to receive(:error).with(/EmailGroupMailbox error: StandardError - boom!/)
        expect { mailbox.process }.to raise_error(StandardError, "boom!")
      end
    end
  end
end
