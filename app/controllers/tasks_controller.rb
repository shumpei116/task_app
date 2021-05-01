class TasksController < ApplicationController
  before_action :get_tasks
  helper_method :sort_column, :sort_direction

  def index
    @tasks = Task.all.order("#{sort_column} #{sort_direction}")
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
      flash[:info] = "新規スケジュールが作成されました"
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

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end
      
    def sort_column
      Task.column_names.include?(params[:sort]) ? params[:sort] : 'id'
    end
      

end