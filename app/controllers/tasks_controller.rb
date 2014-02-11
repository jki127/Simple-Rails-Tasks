class TasksController < ApplicationController
  def index
    @task = Task.new
  	@tasks = Task.all
  end

  def create
  	Task.create task_name
  	redirect_to :back
  end

  def task_name
  	params.require(:task).permit(:task)
  end
  
  def edit
  	@task = Task.find params[:id]
  end
  
  def update
    task = Task.find params[:id]
    if task.update_attributes(params[:task].permit(:task))
      redirect_to tasks_path, :notice => "Your task was sucessfully updated"
    else
      redirect_to :back, :notice => "There was an error in creating updating your task"
    end
  end
  
  def destroy
    Task.destroy params[:id]
    redirect_to :back, :notice => "Task has been deleted"
  end
end
