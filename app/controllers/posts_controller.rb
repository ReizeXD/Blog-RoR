    class PostsController < ApplicationController

        before_action :require_logged_in_user, only: [:edit, :update, :destroy]
        before_action :set_post, only: [:edit, :update, :destroy]
        before_action :require_author_post, only: [:edit, :update, :destroy]

        def index
            @posts=Post.order(created_at: :desc).page(params[:page]).per(3)
        end

        def show
            @post=Post.find(params[:id])
            @comments=@post.comments.order(created_at: :desc)
        end

        def new
            @post=Post.new
        end

        def create
            @post=Post.new(post_params.merge(user_id: current_user.id))
            if @post.save
                flash[:success]=t('flash.posts.create.success')
                redirect_to posts_path
            else
                flash[:danger]=t('flash.posts.create.error')
                render :new
            end
        end
        
        def edit
        end
        
        def update
            if @post.update(post_params)
                flash[:success]=t('flash.posts.update.error')
                redirect_to posts_path
            else
                flash[:danger]=t('flash.posts.update.error')
                render :edit
            end
        end
        
        def destroy
            if @post.destroy
                flash[:success] = t('flash.posts.destroy.success')
            else
                flash[:danger] = t('flash.posts.destroy.error')
            end
            redirect_to posts_path
        end
        
        private
        
        def post_params
            params.require(:post).permit(:title, :content)
        end
        
        def set_post
            @post = Post.find(params[:id])
        end
    end