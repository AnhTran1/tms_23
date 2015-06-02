class UsersController < ApplicationController
  before_action :logged_in_user , only: [:index, :edit, :update]
  before_action :trainee_user

  def index
	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
    @trainee_courses = @user.trainee_courses

  end
  
  def new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
       render 'edit'
    end
  end


  private
  
    def logged_in_user
      unless logged_in?
        store_location
        redirect_to login_url, notice: "Please log in."
      end
    end

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end

