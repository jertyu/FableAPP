class UsersController < ApplicationController
  before_action :authenticate_user! #All user#action require current_user
	# GET
	def show #/u/:id
		@user = User.find_by_username(params[:id]) #Sets @user equal to (params[:id])
		@user_tale = @user.tale #Sets @user_tale equal to @user.tale
		@tales = @user_tale.order('created_at DESC') #Sets @user_tale = to @user_tale.order
		#Basically this is a bad hack to set the @user.tale, and then make it descending
		@tale = Tale.new
	end

	# GET
	def index #/u/
		@users = User.all #Sets @users equal to all users
	end
	def comment_section
	end
end
