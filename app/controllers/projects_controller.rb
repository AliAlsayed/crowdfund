class ProjectsController < ApplicationController
	def index
		@projects = Project.accepting
	end

	def show 
		@project = Project.find(params[:id])
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])
		if @project.update(project_params)
			redirect_to @project, notice: 'project updated'
		else
			render :edit
		end
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to root_path, notice: 'project updated'
		else
			render :new
		end
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		redirect_to root_path, notice: "all gone :("
	end

	private
		def project_params
			params.require(:project).permit(:name, :description, :image_file_name, :team_members,
																			:target_pledge_amount, :pledging_ends_on, :website)
		end
end























