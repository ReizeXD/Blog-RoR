class SessionsController < ApplicationController

    def new
        redirect_to user_path(current_user) if user_signed_in?
    end

    def create 
        user=User.find_by(email: params[:session][:email].downcase)
        @user=user
        if user && user.authenticate(params[:session][:password])
            sign_in(user)
            flash[:success]=t('flash.session.create.success')
            redirect_to root_path
        else
            flash[:danger]=t('flash.session.create.error')
            render :new
        end
    end

    def destroy
        sign_out
        flash[:success]=t('flash.session.destroy.success')
        redirect_to root_url
    end
end