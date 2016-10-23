class UsersController < ApplicationController
  def index
    @users=User.all
  end
  
  
  def new
  end

  def create
    @users=User.new user_params
    if @users.save
      redirect_to root_path
      flash[:success]="Account created successfully"
    else
      render 'new'
      flash[:error]="#{@users.errors.full_messages.to_sentence}"
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  

end
