class ParticipationsController < ApplicationController

  before_filter :user_logged_in

  def create
    @project = Project.find(params[:project_id])
    redirect_to :back unless @project.can_participate? current_user
    @project.users << current_user
    @project.save!
  end

  def destroy
    @project = Project.find(params[:project_id])
    redirect_to :back unless @project.can_quit? current_user
    @project.users.delete current_user
    @project.save!
  end

end