class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save

    redirect_to root_path
  end

  def done
    
  end

  private def task_params
    params.require(:task).permit(:title, :deadline)
   end
end
