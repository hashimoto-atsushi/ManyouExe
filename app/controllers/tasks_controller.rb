class TasksController < ApplicationController
  before_action :set_tasks, :search_task_name, :search_status, only:[:show, :edit, :update, :destroy ]
  PER = 4

  def index

    @tasks = Task.all.order(created_at: :desc).page(params[:page]).per(PER)

    if params[:sort_expired]
      @tasks = Task.all.order(due: :desc).page(params[:page]).per(PER)
    end

    if params[:sort_priority]
      @tasks = Task.all.order(priority: :asc).page(params[:page]).per(PER)
    end

    if search_task_name && search_status
      @tasks = Task.search_by_task_name(params[:task_name]).search_by_status(params[:status]).page(params[:page]).per(PER)
    else
      if search_task_name
        @tasks = Task.search_by_task_name(params[:task_name]).page(params[:page]).per(PER)
      elsif search_status
        @tasks = Task.search_by_status(params[:status]).page(params[:page]).per(PER)
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
    params.require(:task).permit(:task_name, :task_detail, :due, :status, :priority)
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
