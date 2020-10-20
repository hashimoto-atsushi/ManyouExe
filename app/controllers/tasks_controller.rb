class TasksController < ApplicationController
  def index
    @tasks = Task.all
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




  private
  def task_params
    params.require(:task).permit(:task_name, :task_detail)
  end

  def set_tasks
    @task = Task.find(params[:id])
  end  
end
