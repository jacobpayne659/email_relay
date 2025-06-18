class EmailGroupMembershipsController < ApplicationController
  before_action :set_email_group

  def create
    if params[:new_user_email].present? && params[:new_user_name].present?
      user = User.find_or_create_by(email: params[:new_user_email]) do |u|
        u.name = params[:new_user_name]
      end
    else
      user = User.find(params[:user_id])
    end

    @email_group.users << user unless @email_group.users.include?(user)
    redirect_to @email_group
  end

  def destroy
    membership = @email_group.email_group_memberships.find_by(user_id: params[:id])
    membership.destroy if membership
    redirect_to @email_group
  end

  private

  def set_email_group
    @email_group = EmailGroup.find(params[:email_group_id])
  end
end
