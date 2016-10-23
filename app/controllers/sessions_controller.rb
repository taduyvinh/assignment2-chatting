class SessionsController < ApplicationController
  def create
    if @user = User.find_by_email(params[:email])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to root_path
        flash[:success] = "Welcome, #{@user.name}"
      else
        flash.now[:error] = "Incorrect password"
        render 'new'
      end
    else
      flash.now[:error] = "Email not found"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Logged out successfully"
    redirect_to root_path
  end

end
