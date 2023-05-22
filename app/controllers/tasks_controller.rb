class TasksController < ApplicationController
  def index
    @task = Task.new
    @not_done_tasks = Task.where(done_at: nil).order(:priority)
    @done_tasks = Task.where.not(done_at: nil).order(:priority)
  end

  def create
    task = Task.new(task_params)
    if task.save
      flash[:success] = '登録が成功しました'
    else
      flash[:danger] = "登録に失敗しました<br>・#{task.errors.full_messages.join('<br>・')}"
    end
    redirect_to root_path
  end

  def done
    task = Task.find(params[:id])
    if task.update(done_at: Time.zone.now)
      flash[:success] = 'タスク完了！おめでとう！'
    else
      flash[:danger] = "失敗しました"
    end
    redirect_to root_path
  end

  def destroy
    task = Task.find(params[:id])
    if task.destroy
      flash[:info] = 'タスクが削除されました'
    else
      flash[:danger] = "削除に失敗しました"
    end
    redirect_to root_path 
  end

  private 
    def task_params
      params.require(:task).permit(:title, :deadline, :priority)
    end
end