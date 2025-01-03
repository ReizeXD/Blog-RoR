class PasswordResetsController < ApplicationController
        
        
        def new
        end
        
        def create
                if params[:email].empty?
                        flash[:danger]="Insira um Email!"
                        redirect_to password_reset_path
                else
                        @user=User.find_by(email: params[:email])
                        if @user.present?
                                PasswordMailer.with(user: @user).reset.deliver_now
                        end
                        
                        flash[:success]="Uma mensagem de recuperação de senha foi enviada para o seu Email"
                        redirect_to root_path
                end
        end

        def edit
                @user = User.find_signed(params[:token], purpose: "password_reset")
        rescue ActiveSupport::MessageVerifier::InvalidSignature
                flash[:danger]="Token expirado"
                redirect_to entrar_path
        end
        
        def update
                @user = User.find_signed(params[:token], purpose: "password_reset")
                if @user.update(password_params)
                        flash[:success]="Sua senha foi atualizada com sucesso"
                        redirect_to entrar_path
                else
                        flash[:danger]="Senhas diferentes, tente novamente!"
                        render :edit
                end
                rescue ActiveSupport::MessageVerifier::InvalidSignature
                        redirect_to entrar_path, danger: "Token expirado, tente novamente!"
        end
        
        private
        def password_params
            params.require(:user).permit(:password, :password_confirmation)
        end

end