class UsersController < ApplicationController

    before_action :require_logged_in_user, only: [:edit, :update, :edit_password, :update_password]

    def new
        @user= User.new
    end

    def create 
        @user= User.new(user_params)
        if @user.save
            flash[:success]=t('flash.users.profile.create.success')
            redirect_to entrar_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        parametros=user_params.slice(:password, :password_confirmation)
        @user=current_user
        if !@user.authenticate(parametros[:password])
            flash[:danger]=t('flash.users.profile.update.error')
            redirect_to edit_user_path(current_user)
        else
            if @user.update(user_params)
                flash[:success]=t('flash.users.profile.update.success')
                redirect_to root_url
            else
                render 'edit'
            end
        end
    end

    def edit_password
    end

    def update_password
        parametros=password_params.slice(:password, :password_confirmation)
        @user=current_user
        if !@user.authenticate(password_params[:current_password])
            flash[:danger]=t('flash.users.password.update.error')
            redirect_to edit_password_user_path(current_user)
        else
            if current_user.update(parametros)
                flash[:success]=('flash.users.password.update.success')
                redirect_to root_url
            else
                render 'edit_password'
            end
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :current_password, :password, :password_confirmation)
    end

    def password_params
        Rails.logger.debug "Parâmetros recebidos: #{params.inspect}"
        params.require(:user).permit(:current_password, :password, :password_confirmation)
    end
end