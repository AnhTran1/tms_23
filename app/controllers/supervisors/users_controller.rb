class Supervisors::UsersController < ApplicationController
  before_filter :logged_in_user
  before_filter :correct_user

  def index
    @users = User.all.paginate(page: params[:page], per_page: 5)
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "Create user success!"
      redirect_to supervisors_user_path(@user)
    else
      render 'new'
    end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to supervisors_user_path(@user)
    else
       render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Trainee destroyed."
    redirect_to supervisors_users_url
  end

  private
  
    def logged_in_user
      unless logged_in?
        store_location
        redirect_to login_url, notice: "Please log in."
      end
    end
    def correct_user
      redirect_to(root_path) unless supervisors_user?(current_user)
    end
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end

