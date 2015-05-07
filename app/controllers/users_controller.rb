class UsersController < ApplicationController
  before_action :signed_in_user
  before_action :trainee_user

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
end

