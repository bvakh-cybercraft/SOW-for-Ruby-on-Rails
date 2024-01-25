class TasksController < ApplicationController
  before_action :find_task, only: %i[show edit update destroy]

  has_scope :by_status
  has_scope :by_priority

  def index
    @tasks = apply_scopes(Task.includes(images_attachments: :blob)).all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: "Task was created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @task.destroy
      redirect_to tasks_path, notice: "Task was successfully deleted."
    else
      redirect_to tasks_path, alert: "Unable to delete the task."
    end
  end

  private

  def find_task
    @task = Task.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :status, :priority, images: [])
  end
end
