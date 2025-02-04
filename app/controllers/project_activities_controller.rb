class ProjectActivitiesController < ApplicationController
  before_action :find_project

  def create_comment
    @activity = @project.project_activities.create(
      user: current_user,
      activity_type: "comment",
      content: params[:content]
    )

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to project_path(@project) }
    end
  end

  def update_status
    old_status = @project.status

    if @project.update(status: params[:status])
      @activity = @project.project_activities.create(
        user: current_user,
        activity_type: "status_change",
        old_status: old_status,
        new_status: @project.status
      )

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @project }
      end
    else
      render "projects/show", status: :unprocessable_entity
    end
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end
end
