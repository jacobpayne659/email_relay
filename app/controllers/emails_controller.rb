class EmailsController < ApplicationController
  def destroy
    email = Email.find(params[:id])
    email.update(deleted_at: Time.current)
    redirect_back fallback_location: root_path, notice: "Email deleted."
  end
end
