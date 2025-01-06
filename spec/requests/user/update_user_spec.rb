require 'rails_helper'

RSpec.describe "Users", type: :request do
    let(:user) { create(:user) }
    
    before do
        log_in_as(user)
    end

    context "Com parametros validos" do
      let(:valid_params) do
        {
          user: {
            name: "Tiago",
            password: user.password,
            password_confirmation: user.password,
          }
        }
      end

      it "atualiza o usuario" do
        patch user_path(user), params: valid_params
        user.reload
        expect(user.name).to eq("Tiago")
      end
  
      it "redireciona para a pagina root" do
        patch user_path(user), params: valid_params 
        expect(response).to redirect_to(root_path)
      end
    end
  end
  