class ProjectsController < ApplicationController
  load_and_authorize_resource
  before_action :set_statuses, only: [:new, :edit, :update_status]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.projects.order(created_at: :desc).page(params[:page])
  end

  def show
    @comment = @project.comments.new
    @comments = @project.comments.order(created_at: :desc).page(params[:page] || 1)
    @activities = PublicActivity::Activity
                    .where(trackable: @project)
                    .order(created_at: :desc)
                    .page(params[:page] || 1)
  end

  def update_status
    if @project.update(status_id: params[:status_id])
      redirect_to @project, notice: 'Status updated successfully'
    else
      redirect_to @project, alert: 'Error updating status'
    end
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.new(project_params)

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def edit
    @statuses = Project.all_statuses
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully deleted.'
  end

  private

  def set_project
    @project = current_user.projects.find(params[:id])
  end

  def set_statuses
    @statuses = Project.all_statuses
  end

  def project_params
    params.require(:project).permit(:title, :description, :status_id)
  end
end