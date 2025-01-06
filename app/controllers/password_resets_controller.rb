class PasswordResetsController < ApplicationController
        
        
        def new
        end
        
        def create
                if params[:email].empty?
                        flash[:danger]=t('flash.passwordreset.create.error')
                        redirect_to password_reset_path
                else
                        @user=User.find_by(email: params[:email])
                        if @user.present?
                                PasswordMailer.with(user: @user).reset.deliver_now
                        end
                        
                        flash[:success]=t('flash.passwordreset.create.success')
                        redirect_to root_path
                end
        end

        def edit
                @user = User.find_signed(params[:token], purpose: "password_reset")
        rescue ActiveSupport::MessageVerifier::InvalidSignature
                flash[:danger]=t('flash.passwordreset.token')
                redirect_to entrar_path
        end
        
        def update
                @user = User.find_signed(params[:token], purpose: "password_reset")
                if @user.update(password_params)
                        flash[:success]=t('flash.passwordreset.update.success')
                        redirect_to entrar_path
                else
                        flash[:danger]=t('flash.passwordreset.update.error')
                        render :edit
                end
                rescue ActiveSupport::MessageVerifier::InvalidSignature
                        redirect_to entrar_path, danger: t('flash.passwordreset.token')
        end
        
        private
        def password_params
            params.require(:user).permit(:password, :password_confirmation)
        end

end