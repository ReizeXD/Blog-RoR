class ApplicationController < ActionController::Base
    before_action :set_locale
    include SessionsHelper
    include PostsHelper

    private
        def require_logged_in_user
            unless user_signed_in?
                flash[:danger]=t('flash.view.limit.error')
                redirect_to entrar_path
            end
        end

        def require_author_post
            unless post_user(@post)
                flash[:danger]=t('flash.view.author.error')
                redirect_to posts_path and return
            end
        end

        def set_locale
            I18n.locale = params[:locale] || request.env['HTTP_ACCEPT_LANGUAGE']&.scan(/^[a-z]{2}/)&.first || I18n.default_locale
        end
end
