class SessionsController < ApplicationController

    def new
        redirect_to user_path(current_user) if user_signed_in?
    end

    def create 
        user=User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            sign_in(user)
            redirect_to root_path
        else
            flash[:danger]="Email ou senha invalidos"

            redirect_to entrar_path
        end
    end

    def destroy
        sign_out
        flash[:success]="Lougout com sucesso"
        redirect_to root_url
    end
end