class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.where(status: :active)
    @tasks_done = Task.where(status: :done).order(:time)
  end

  def create
    task = Task.new(task_params)
    task.save
    redirect_to root_path
  end

  def done
    @today = Date.today
    task = Task.find(params[:id])
    task.done!
    task.update(done_at: @today )
    redirect_to root_path
  end

  private def task_params
    params.require(:task).permit(:title, :deadline)
   end
end
