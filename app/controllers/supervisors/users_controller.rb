class Supervisors::UsersController < ApplicationController
  before_filter :logged_in_user
  before_filter :correct_user

  def show
  	@user = User.find(params[:id])
  end
  def new
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
end

