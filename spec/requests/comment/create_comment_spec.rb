require 'rails_helper'

RSpec.describe "Posts", type: :request do

    describe "POST /posts" do

        let(:user) { create(:user) }
        let(:blog_post) { create(:post, user: user) } 
    
        before do
            log_in_as(user)
        end

        context "com parametros validos " do    
            let(:valid_params) do
                {comment: FactoryBot.attributes_for(:comment)}
            end
            it "cria um commentario" do
                expect{
                    post post_comments_path(blog_post), params: valid_params
            }.to change(Post, :count).by(1)
            end

            it "redireciona para a pagina root" do
                post post_comments_path(blog_post), params: valid_params
                expect(response).to redirect_to(post_path(blog_post))
            end
        end
    end
end