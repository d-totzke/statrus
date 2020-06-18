# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :require_signin
  # skip_before_action :require_admin



  # GET /resource/sign_in
  def new
   
  end

  # POST /resource/sign_in
  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{user.name}!"
      redirect_to landing_path
    else
      flash.now[:alert] = "Invalid email/password combination!"
      render :new
    end
  end

  # DELETE /resource/sign_out
  def destroy
    session[:user_id] = nil
    session[:rold] = nil
    redirect_to root_url, notice: "You're now signed out!"
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
end
