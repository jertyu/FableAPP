class UsersController < ApplicationController
  before_action :owned_user, only: [:edit_user] #Denies access to :edit,:update,:destroy unless fit condition

	# GET
	def show #/u/:id
		@user = User.find_by_username(params[:id]) #Sets @user equal to (params[:id])
		if @user.present? # checks if @user exists
		@user_tale = @user.tale #Sets @user_tale equal to @user.tale
		@tales = @user_tale.order('created_at DESC') #Sets @user_tale = to @user_tale.order
		end
		#Basically this is a bad hack to set @tales to descending. Also if a user exists. 
		@tale = Tale.new #For creating a tale on user profiles
	end

	# GET
	def index #/u/
		@users = User.all #Sets @users equal to all users
	end
	def comment_section
	end
	def edit_user
		@user = User.find_by_username(params[:id])
	end
    def owned_user #user auth
      unless current_user && current_user == User.find_by_username(params[:id]) || current_user && current_user.admin? && !User.find_by_username(params[:id]).owner? || current_user.owner?
      flash[:alert] = "Access denied" #flash msg
      redirect_to root_path #temporary redirect
    end	
end
end