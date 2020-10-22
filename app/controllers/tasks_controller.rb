class TasksController < ApplicationController
  before_action :set_tasks, only:[:show, :edit, :update, :destroy ]
  def index
    if params[:sort_expired]
      @tasks = Task.all.order(due: :desc)
    else
      @tasks = Task.all.order(created_at: :desc)
    end

    if search_task_name && search_status
      @tasks = Task.search_by_task_name(params[:task_name]).search_by_status(params[:status])
    else
      if search_task_name
        @tasks = Task.search_by_task_name(params[:task_name])
      elsif search_status
        @tasks = Task.search_by_status(params[:status])
      else
        @tasks = Task.all.order(created_at: :desc)
      end
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to task_path(@task.id), notice: "新規タスクを登録しました!"
    else
      render :new
    end
  end

  def show
    @task
  end

  def edit
    @task
  end

  def update
    @task
    if @task.update(task_params)
      redirect_to tasks_path, notice: "既存タスクを編集しました!"
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: "タスクを削除しました！"
  end

  private
  def task_params
    params.require(:task).permit(:task_name, :task_detail, :due, :status)
  end

  def set_tasks
    @task = Task.find(params[:id])
  end

   def search_task_name
     search_task_name = params[:task_name].present?
   end

   def search_status
     search_status = params[:status].present?
   end
end
