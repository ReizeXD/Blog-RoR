require 'rails_helper'

RSpec.describe "Posts", type: :request do
    let(:user) { create(:user, password: "123456", password_confirmation: "123456") }
    let(:blog_post) { create(:post, user: user) }
    
    before do
        log_in_as(user)
    end

    context "Com parametros validos" do
      let(:valid_params) do
        {
          post: {
            title: "Exemplo",
            content: "Projeto"
          }
        }
      end

      it "atualiza o post" do
        patch post_path(blog_post), params: valid_params
        blog_post.reload
        expect(blog_post.title).to eq("Exemplo")
        expect(blog_post.content).to eq("Projeto")
      end
  
      it "redireciona para a pagina root" do
        patch post_path(blog_post), params: valid_params 
        expect(response).to redirect_to(posts_path)
      end
    end
  end
  