class TasksController < ApplicationController
  before_action :set_task, only: [ :show, :edit, :update, :destroy ]
  # READ
  def index
    @tasks = Task.all
  end

  def show
  end

  # CREATE
  def new
    @task = Task.new
  end

  def create
    task = Task.create(task_params)
    redirect_to task_path(task)
  end

  # UPDATE
  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  # DESTROY
  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :address, :rating)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
