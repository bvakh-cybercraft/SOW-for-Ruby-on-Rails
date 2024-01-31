class TasksController < ApplicationController
  before_action :find_task, only: %i[show edit update destroy]
  before_action :is_author?, only: %i[show edit update destroy]
  before_action :authenticate_user!

  has_scope :by_status
  has_scope :by_priority

  def index
    @tasks = apply_scopes(Task.includes(images_attachments: :blob)).where(user_id: current_user.id).page(params[:page]).per(4)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      redirect_to @task, notice: 'Task was created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @task.update(task_params)
      @task.save
      respond_to do |format|
        format.js
        format.html { redirect_to tasks_url, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.js
        format.html { render :edit, alert: 'Failed to update task.', status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "task was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end
  end

  private

  def find_task
    @task = Task.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def is_author?
    redirect_to root_path, alert: "Access is denied. You are not the author of this task." unless @task.user == current_user
  end

  def task_params
    params.fetch(:task, {}).permit(:title, :description, :due_date, :status, :priority, :user_id, images: [])
  end
end
