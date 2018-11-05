class UsersController < ApplicationController

	  before_action :current_user?, only: [:edit, :destroy]
	  
	 def index
    	@users = User.all
  	end

  	  def current_user?
    	if @user != current_user
        flash[:alert] = "You are not the owner."
        redirect_to users_path
    end
	end

	def show
	  @user = User.find(params[:id])
	end

end
