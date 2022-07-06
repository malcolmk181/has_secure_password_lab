class UsersController < ApplicationController
    def new
        # signup form
        @user = User.new
    end

    def create
       
        @user = User.new(user_params)
        
        # creates a new user
        if @user.authenticate(params[:user][:password]) && @user.save

            # logs you in
            session[:user_id] = @user.id

            # set your password if confirmation matches

            redirect_to homepage_path(@user)
        else
            # redirects you if your password and confirmation don't match
            redirect_to signup_prompt_path
        end
        
    end

    def show
        if !session[:user_id].nil?
            @user = User.find(session[:user_id])
        else
            redirect_to login_prompt_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
