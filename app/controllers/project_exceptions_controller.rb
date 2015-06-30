class ProjectExceptionsController < ApplicationController

  before_filter :user_logged_in

  def create
    @project = Project.find(params[:project_id])
    return redirect_to projects_path if !@project.can_request_exception?(current_user)
    ProjectException.create!(permited_params)
  end

  def new 
    @project = Project.find(params[:project_id])
    return redirect_to projects_path if !@project.can_request_exception?(current_user)
  end

  private

  def permited_params
    params[:project_exception].permit(:description, :user_id, :project_id)
  end

end