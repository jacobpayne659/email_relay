class EmailGroupMailbox < ApplicationMailbox
  def process
    group_email = mail.to&.first&.downcase&.strip
    unless group_email
      Rails.logger.warn "EmailGroupMailbox: No recipient email found in mail.to"
      return
    end

    email_group = EmailGroup.find_by('LOWER(group_email) = ?', group_email)

    unless email_group
      Rails.logger.warn "EmailGroupMailbox: No EmailGroup found for #{group_email}"
      return
    end

    Email.create!(
      subject: mail.subject,
      body: mail.decoded,
      email_group: email_group,
      from: mail.from&.first || "<unknown>",
    )

  rescue => e
    Rails.logger.error "EmailGroupMailbox error: #{e.class} - #{e.message}"
    raise e
  end
end
