class TasksController < ApplicationController
  before_action :find_task, only: %i[show edit update destroy]

  has_scope :by_status
  has_scope :by_priority

  def index
    @tasks = apply_scopes(Task.includes(images_attachments: :blob)).page(params[:page]).per(4)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    return unless @task.destroy

    redirect_to tasks_path
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
