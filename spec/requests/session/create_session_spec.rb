require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let(:user) { create(:user, password: "123456", password_confirmation: "123456") }

  describe "POST /entrar" do
    context "com credenciais validas" do
      let(:valid_params) { { session: { email: user.email, password: "123456" } } }

      it "loga o usuário e redireciona para a página inicial" do
        post entrar_path, params: valid_params
        expect(session[:user_id]).to eq(user.id)
        expect(response).to redirect_to(root_path)
      end
    end

    context "com credenciais inválidas" do
      let(:invalid_params) { { session: { email: user.email, password: "111111" } } }

      it "não loga o usuário e renderiza novamente a página de login" do
        post entrar_path, params: invalid_params
        expect(session[:user_id]).to be_nil
        expect(response).to render_template(:new)
      end
    end
  end
end
