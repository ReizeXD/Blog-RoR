class PostsController < ApplicationController

    def index
        @posts=Post.order(created_at: :desc).page(params[:page]).per(3)
    end

    def show
        @post=Post.find_by(params[:id])
        respond_to do |format|
            format.html { render partial: 'post', locals: { post: @post } }
        end
    end

    def new
        @post=Post.new
    end

    def create
        @post=Post.new(post_params.merge(user_id: current_user.id))
        if @post.save
            flash[:success]="Post publicado com sucesso!"
            redirect_to posts_path
        else
            flash[:danger]="Erro ao publicar post"
            render :new
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :content)
    end
end