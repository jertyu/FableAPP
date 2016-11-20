class UsersController < ApplicationController
	  before_filter :authenticate_user!, except: [:index, :show]
  before_action :authenticate_user!
	def show
		@user = User.find_by_username(params[:id])

		@user_tale = Tale.where(:user_id => current_user.id)
		@tales = @user_tale.order('created_at DESC')
	end
	def index
		@users = User.all
	end
end
