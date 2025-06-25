class GroupMailer < ApplicationMailer
  def forward_email(user, original_mail)
    mail(
      to: user.email,
      from: original_mail.from&.first || "default@email.com",
      subject: original_mail.subject,
      body: original_mail.body.decoded
    )
  end
end
