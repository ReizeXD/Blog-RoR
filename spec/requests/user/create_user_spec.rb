require 'rails_helper'

RSpec.describe "Users", type: :request do

    describe "POST /users" do

        context "com parametros validos " do    
            let(:valid_params) do
                {user: FactoryBot.attributes_for(:user)}
            end
            it "cria um usuario" do
                expect{
                    post users_path, params: valid_params
            }.to change(User, :count).by(1)
            end

            it "redireciona para a pagina root" do
                post users_path, params: valid_params
                expect(response).to redirect_to(entrar_path)
            end
        end
    end
end