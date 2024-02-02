class TaskCheckboxesController < ApplicationController
  def update
    @task_checkbox = TaskCheckbox.find(params[:id])
    if @task_checkbox.update(task_checkbox_params)
      redirect_to task_path(@task_checkbox.task), notice: 'Task checkbox was updated.'
    else
      render task_path(@task_checkbox.task), status: :unprocessable_entity
    end
  end

  def destroy

    binding.pry

    @task_checkbox = TaskCheckbox.find(params[:id])
    @task_checkbox.destroy
  end

  private

  def task_checkbox_params
    params.require(:task_checkbox).permit(:id, :name, :checked)
  end
end
