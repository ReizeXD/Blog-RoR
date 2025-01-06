require 'rails_helper'

RSpec.describe "Posts", type: :request do

    describe "POST /posts" do

        let(:user) { create(:user) }  
    
        before do
            log_in_as(user)
        end

        context "com parametros validos " do    
            let(:valid_params) do
                {post: FactoryBot.attributes_for(:post)}
            end
            it "cria um post" do
                expect{
                    post posts_path, params: valid_params
            }.to change(Post, :count).by(1)
            end

            it "redireciona para a pagina root" do
                post posts_path, params: valid_params
                expect(response).to redirect_to(posts_path)
            end
        end
    end
end