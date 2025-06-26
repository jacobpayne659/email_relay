require 'rails_helper'

RSpec.describe EmailsController, type: :controller do
  describe "#destroy" do
    let!(:email) { create(:email, deleted_at: nil) }

    it "soft deletes the email by setting deleted_at" do
      delete :destroy, params: { id: email.id }
      email.reload
      expect(email.deleted_at).not_to be_nil
    end

    it "redirects back with a notice" do
      request.env["HTTP_REFERER"] = "/some/page"
      delete :destroy, params: { id: email.id }
      expect(response).to redirect_to("/some/page")
      expect(flash[:notice]).to eq("Email deleted.")
    end

    it "falls back to root_path if no referer is set" do
      request.env["HTTP_REFERER"] = nil
      delete :destroy, params: { id: email.id }
      expect(response).to redirect_to(root_path)
    end
  end
end
