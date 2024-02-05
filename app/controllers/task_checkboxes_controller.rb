class TaskCheckboxesController < ApplicationController
  def update
    @task_checkbox = TaskCheckbox.find(params[:id])

    if @task_checkbox.update(task_checkbox_params)
      render json: { status: 'success' }
    else
      render json: { status: 'error' }, status: :unprocessable_entity
    end
  end

  def destroy
    @task_checkbox = TaskCheckbox.find(params[:id])
    @task_id = @task_checkbox.task.id
    @task_checkbox.destroy
    respond_to do |format|
      format.html { redirect_to task_path(@task_id), notice: "task checkbox was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end
  end

  private

  def task_checkbox_params
    params.require(:task_checkbox).permit(:id, :name, :checked)
  end
end
