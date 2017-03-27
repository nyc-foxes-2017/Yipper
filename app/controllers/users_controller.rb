class UsersController < ApplicationController

	def index
	end

	def new
		@user = User.new

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
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password)
	end
end
