require 'rails_helper'

RSpec.describe UserController, type: :controller do
  setup do
      @user = User.create!({email: "me@gmail.com", password: "123456", password_confirmation: "123456"})
      sign_in @user
  end

  describe "GET #show" do
    it "returns http success" do
      @user = User.create!({email: "me@gmail.com", password: "123456", password_confirmation: "123456"})
      get :show, { id: @user.to_param }
      expect(response).to have_http_status(:success)
    end
  end

end
