class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(name: params[:user][:name])
        
        # rejects invalid passwords
        # rejects empty passwords
       
        if @user && @user.authenticate(params[:user][:password])

            # logs you in with correct password
            session[:user_id] = @user.id

            redirect_to homepage_path(@user)
        else
            redirect_to login_prompt_path
        end
    end
end
