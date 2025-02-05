class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]

  def index
    @pagy, @projects = pagy Project.order(created_at: :desc)
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      @project.project_activities.create(
        user: current_user,
        activity_type: "create",
        new_status: @project.status
      )
      redirect_to @project, notice: "Project was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :status)
  end
end
