require 'rails_helper'

RSpec.describe Admin::RepresentationsController do
  let(:current_user) { FactoryBot.create(:user) }
  let(:impersonated_user) { FactoryBot.create(:user) }

  before do
    allow(controller).to receive(:original_current_user).and_return(current_user)
  end

  describe "POST #create" do
    subject(:perform_request) { post :create, params: { user_id: impersonated_user } }

    it "does not change the current user" do
      expect { perform_request }.to_not change { controller.current_user }.from(current_user)
    end

    context "as an admin" do
      let(:current_user) { FactoryBot.create(:user, admin: true) }

      it "changes the current user" do
        expect { perform_request }
          .to change { controller.current_user }.from(current_user).to(impersonated_user)
      end
    end
  end

  describe "DELETE #destroy" do
    subject(:perform_request) { delete :destroy, params: { user_id: impersonated_user } }

    let(:current_user) { FactoryBot.create(:user, admin: true) }

    before do
      session[:delegated_user_id] = impersonated_user.id
    end

    it "changes the current user" do
      expect { perform_request }
        .to change { controller.current_user }.from(impersonated_user).to(current_user)
    end
  end
end
