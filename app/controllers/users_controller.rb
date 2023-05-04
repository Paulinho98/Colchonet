class UsersController < ApplicationController
    

    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)

        if @user.save
         SignupMailer.confirm_email(@user).deliver
         redirect_to @user, :notice => 'Cadastro criado com sucesso!'
        else
         render :new
        end
    end
    

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        
        if @user.update_attributes(user_params)
            redirect_to @user, :notice => 'Cadastro atualizado com sucesso!'
        else
            render :update
        end
    
    end

    private

    def user_params
        params.require(:user).permit(:bio, :email, :full_name, :location, :password, :password_confirmation)
    end

    private

    def can_change
        unless user_signed_in? && current_user == user
            redirect_to user_path(params[:id])
        end
    end

    def user
        
    end
end