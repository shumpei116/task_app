class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
    def task_params
      params.require(:task).premit(:title, :start_date, :end_date, :all_day)
    end
end
