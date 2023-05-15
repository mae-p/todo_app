class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.where(done_at:nil).order(:deadline)
    @tasks_done = Task.where.not(done_at:nil)
    @today = Date.today
  end

  def create
    task = Task.new(task_params)
    if task.save
      flash[:success] = '登録が成功しました'
      redirect_to root_path
    else
      flash[:danger] = "登録に失敗しました<br>・#{task.errors.full_messages.join('<br>・')}"
      redirect_to root_path
    end
  end

  def done
    @today = Date.today
    @task = Task.find(params[:id])
    @task.update(done_at: @today)
    redirect_to root_path
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    flash[:notice] = 'タスクが削除されました'
    redirect_to root_path
  end

  private 
    def task_params
      params.require(:task).permit(:title, :deadline)
    end
end
