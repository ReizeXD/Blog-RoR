module PostsHelper

    def post_user(post)
       current_user && post.user.id==current_user.id
    end


end