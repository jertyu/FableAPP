class UsersController < ApplicationController
	def show
		@user = User.find_by_username(params[:id])
		@tales = Tale.where(:user_id => current_user.id)
	end
	def index
		@users = User.all
	end
end
