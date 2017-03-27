class YipsController < ApplicationController

	def create
		@yip = current_user.yips.new(yip_params)

		if @yip.save
			redirect_to current_user
		else
			flash[:error] = "Problem!"
			redirect_to current_user
		end
	end

	def index
		@yips = Yip.all 
		@yip = Yip.new
	end

	def yip_params
		params.require(:yip).permit(:content)
	end
end
