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
      flash[:success] = "新規スケジュールが作成されました"
      redirect_to tasks_path
    else
      render "new"
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "スケジュールが更新されました"
      redirect_to tasks_path
    else
      render "edit"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "スケジュールを削除しました"
    redirect_to tasks_path
  end

  private
    def task_params
      params.require(:task).permit(:title, :start_date, :end_date, :all_day, :memo)
    end

    def get_tasks
      @tasks = Task.all
    end

end
