class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_signin
  
  helper_method :correct_user
  helper_method :current_user
  private

  	def require_signin
    	unless current_user
      		redirect_to new_sessions_url, alert: "Please sign in first!"
    	end
  	end
  	
  	def current_user
    	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  	end

    def correct_user
      if current_user != User.find(session[:user_id])
        redirect_to landing_path, alert: "You do not have permissions to view other users"
      end
    end
    
end