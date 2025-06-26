class EmailGroupMailbox < ApplicationMailbox
  def process
    group_email = mail.to&.first&.downcase&.strip
    unless group_email
      Rails.logger.warn "EmailGroupMailbox: No recipient email found in mail.to"
      return
    end

    email_group = EmailGroup.find_by(group_email: group_email)
    unless email_group
      Rails.logger.warn "No EmailGroup found for #{group_email}"
      return
    end

    email = Email.create!(
      subject: mail.subject,
      body: mail.decoded,
      email_group: email_group,
      from: mail.from&.first || "<unknown>",
    )

    email_group.users.find_each do |user|
      # binding.pry
      GroupMailer.with(user: user, email: email).relay_email.deliver_now
    end
  end
end
