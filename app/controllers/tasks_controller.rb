class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.where(done_at:nil).order(:priority)
    @tasks_done = Task.where.not(done_at:nil)
    @today = Date.today
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = '登録が成功しました'
      redirect_to root_path
    else
      flash[:danger] = '項目を入力してください'
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
    flash[:info] = 'タスクが削除されました'
    redirect_to root_path
  end

  private 
    def task_params
      params.require(:task).permit(:title, :deadline, :priority)
    end
end
