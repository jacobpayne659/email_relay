class GroupMailer < ApplicationMailer
  def relay_email
    @user = params[:user]
    @email = params[:email]

    mail(
      to: @user.email,
      from: @email.from,
      subject: @email.subject
    ) do |format|
      format.text { render plain: @email.body }
    end
  end
end
