class TasksController < ApplicationController
  before_action :set_tasks, only:[:show, :edit, :update, :destroy ]
  def index
    @tasks = Task.all.order(created_at: :desc)
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
    params.require(:task).permit(:task_name, :task_detail, :due)
  end

  def set_tasks
    @task = Task.find(params[:id])
  end
end
