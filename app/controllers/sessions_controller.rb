class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:danger] = "Invalid email/password combination"
      render "new"
    end
  end

  def destroy
    reset_session
    @current_user = nil
    redirect_to root_url
  end
end
