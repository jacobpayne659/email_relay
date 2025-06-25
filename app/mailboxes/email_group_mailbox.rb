class EmailGroupMailbox < ApplicationMailbox
  def process
    begin
      group_email = mail.to.first || "designers@email.com"
      email_group = EmailGroup.find_by(group_email: group_email)

      # Rails.logger.info("Processing email for group: #{group_email}")

      unless email_group
        Rails.logger.warn "No EmailGroup found for #{group_email}"
        return
      end

      # Persist the email
      Email.create!(
        subject: mail.subject,
        body: mail.decoded,
        email_group: email_group
      )

      # Forward to all group members
      email_group.users.find_each do |user|
        GroupMailer.forward_email(user, mail).deliver_later
      end
    rescue => e
      Rails.logger.error "EmailGroupMailbox error: #{e.class} - #{e.message}"
      raise e
    end
  end
end
