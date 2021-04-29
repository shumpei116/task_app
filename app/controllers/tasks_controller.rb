class TasksController < ApplicationController
  before_action :get_tasks

  def index
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "新規タスクが作成されました"
      redirect_to tasks_path
    else
      render "new"
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update

  end

  def destroy

  end

  private
    def task_params
      params.require(:task).permit(:title, :start_date, :end_date, :all_day)
    end

    def get_tasks
      @tasks = Task.all
    end
end
