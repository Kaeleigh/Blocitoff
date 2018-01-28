require 'rails_helper'

RSpec.describe UsersController, type: :controller do


  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
      get :show
      expect(response).to render_template :show
    end
  end

# closes RSpec
end
