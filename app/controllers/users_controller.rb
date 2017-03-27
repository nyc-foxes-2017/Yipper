class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		if current_user
			redirect_to pups_path
		else
			@user = User.new
		end

	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to @user, notice: "Thank you for signing up!"
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
		@yip = Yip.new
		@relationship = Relationship.where(
			follower_id: current_user.id,
			followed_id: @user.id).first_or_initialize if current_user
	end

	def pups
		if current_user
			@yip = Yip.new
			pups_ids = current_user.followeds.map{|followed| followed.id}.push(current_user.id)
			@yips = Yip.where(user_id: pups_ids)
		else
			redirect_to root_url
		end

	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password)
	end
end
