class CommentsController < ApplicationController
    
    def create
        @post=Post.find(params[:post_id])
        if current_user.nil?
            @comment=@post.comments.build(comments_params)
        else
            @comment=@post.comments.build(comments_params.merge(user_id: current_user.id, anon: false))
        end

        if @comment.save
            flash[:success]="Comentário publicado com sucesso!"
        else
            flash[:danger]="Erro ao publicar comentário"
        end
        redirect_to post_path(@post)
    end


    private
        
    def comments_params
        params.require(:comment).permit(:content)
    end

end