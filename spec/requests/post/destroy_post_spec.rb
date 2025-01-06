require 'rails_helper'

RSpec.describe "Posts", type: :request do
    let(:user) { create(:user, password: "123456", password_confirmation: "123456") }
    let(:blog_post) { create(:post, user: user) }
    
    before do
        log_in_as(user)
    end

    context "Com parametros validos" do


      it "deleta o post" do
        delete post_path(blog_post)
        expect { blog_post.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end
  
      it "redireciona para a pagina root" do
        delete post_path(blog_post)
        expect(response).to redirect_to(posts_path)
      end
    end
  end
  