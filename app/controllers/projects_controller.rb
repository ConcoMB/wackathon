class ProjectsController < ApplicationController

  before_filter :user_logged_in

  def index
    @projects = Project.all.order('random()')
  end

end