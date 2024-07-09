class SessionController < ApplicationController

  def new
    if session[:user_id] != nil
       redirect_to employees_path, alert: "already logged in, Please Log out!"
    end
    @user = User.new()
  end

  def create

    @user = User.find_by_name(params[:user][:name]);
    
    if @user.password == params[:user][:password]
      session[:user_id] = @user.id
      redirect_to employees_path, notice:"#{@user.name} has successfully logged in "
    else
      render :new, alert:"please enter the valid password"
    end
  end

  def destroy

    @name = User.find(session[:user_id]);
    session.delete(:user_id)
    redirect_to log_in_path, notice:"#{@name.name} has logged out succesfully"
  end

  private
    def user_params
        params.require(:user).permit(:name,:password)
    end
end
