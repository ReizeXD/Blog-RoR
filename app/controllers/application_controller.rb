class ApplicationController < ActionController::Base
    include SessionsHelper
    include PostsHelper

    private
        def require_logged_in_user
            unless user_signed_in?
                flash[:danger]="Área restrita, faça o login!"
                redirect_to entrar_path
            end
        end

        def require_author_post
            unless post_user(@post)
                flash[:danger]="Esse post não é seu"
                redirect_to posts_path and return
            end
        end
end
