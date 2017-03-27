class YipsController < ApplicationController

	def create
		@yip = Yip.new(params[:yip])
		@yip.user_id = current_user.id

		if @yip.save
			redirect_to current_user
		else
			flash[:error] = "Problem!"
			redirect_to current_user
		end
	end
end
