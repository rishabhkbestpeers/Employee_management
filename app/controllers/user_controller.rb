class UserController < ApplicationController
    
    def new
        if session[:user_id] != nil
            redirect_to employees_path, alert: "already logged in , Please Logout!"
         end
        @user = User.new()
    end
    def create
        @user = User.new(user_params)
        if @user.save
           redirect_to log_in_path, notice: "#{@user.name} signed up succesfully"
        else
           redirect_to sign_up_path, alert: "name is already taken, try with different name"
        end
    end

    private
    def user_params
        params.require(:user).permit(:name,:password)
    end
end
