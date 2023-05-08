class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.where(done_at:nil)
    @tasks_done = Task.where.not(done_at:nil).order(:time)
  end

  def create
    task = Task.new(task_params)
    task.save
    redirect_to root_path
  end

  def done
    @today = Date.today
    task = Task.find(params[:id])
    task.update(done_at: @today)
    redirect_to root_path
  end

  private def task_params
    params.require(:task).permit(:title, :deadline)
   end
end
