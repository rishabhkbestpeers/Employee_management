class ApplicationController < ActionController::Base
    before_action :is_authenticate?
  
    def is_authenticate?
      return if ["session","user"].include?(params[:controller]) && ["new","create"].include?(params[:action])
      
      if session[:user_id].nil?
         redirect_to session_new_path, notice:"please login !"
      end
    end
  
end
