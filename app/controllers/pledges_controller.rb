class PledgesController < ApplicationController
	def index
		@project = Project.find(params[:project_id])
		@pledges = @project.pledges
	end
	def new
		@project = Project.find(params[:project_id])
		@pledge = @project.pledges.new
	end
	def create
		@project = Project.find(params[:project_id])
		@pledge = @project.pledges.new(pledge_params)
		if @pledge.save
			redirect_to project_pledges_path(@project), notice: 'Thanks for your support'
		else
			render :new
		end
	end
	private 
		def pledge_params
			params.require(:pledge).permit(:name, :email, :pledge_amount, :comment)
		end
end
