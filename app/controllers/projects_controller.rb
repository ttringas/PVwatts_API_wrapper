class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.create(params[:project])
    if @project.save
      redirect_to @project
    else
      render 'new'
    end
    
  end

  def show
    @project = Project.find(params[:id])
  end

end
