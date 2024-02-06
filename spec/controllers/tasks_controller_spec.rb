require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new task' do
        task_params = { title: 'Sample Task', description: 'Sample Description', due_date: Date.today }
        post :create, params: { task: task_params }
        expect(Task.count).to eq(1)
      end

      it 'redirects to the created task' do
        task_params = { title: 'Sample Task', description: 'Sample Description', due_date: Date.today }
        post :create, params: { task: task_params }
        expect(response).to redirect_to(Task.last)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new task' do
        post :create, params: { task: { title: 'Invalid Task' } }
        expect(Task.count).to eq(0)
      end

      it 'is invalid with a title longer than 120 characters' do
        long_title = 'A' * 121
        task = build(:task, title: long_title)

        expect(task).to be_invalid
        expect(task.errors[:title]).to include('is too long (maximum is 120 characters)')
      end

      it 'is invalid with a description longer than 200 characters' do
        long_desc = 'A' * 201
        task = build(:task, description: long_desc)

        expect(task).to be_invalid
        expect(task.errors[:description]).to include('is too long (maximum is 200 characters)')
      end
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      task = create(:task)
      get :show, params: { id: task.to_param }
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a successful response' do
      task = create(:task)
      get :edit, params: { id: task.to_param }
      expect(response).to be_successful
    end
  end

  describe 'PATCH #update' do
    context 'with valid parameters' do
      it 'updates the requested task' do
        new_attributes = { title: 'New Title' }
        task = create(:task)

        put :update, params: { id: task.to_param, task: new_attributes }
        task.reload
        expect(task.title).to eq('New Title')
      end
    end

    context 'with invalid parameters' do
      it 'does not update the task' do
        task = create(:task)
        patch :update, params: { id: task.to_param, task: attributes_for(:task, title: nil) }
        task.reload
        expect(task.title).not_to eq(nil)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested task' do
      task = create(:task)
      expect {
        delete :destroy, params: { id: task.to_param }
      }.to change(Task, :count).by(-1)
    end

    it 'redirects to the tasks list' do
      task = create(:task)
      delete :destroy, params: { id: task.to_param }
      expect(response).to redirect_to(tasks_url)
    end
  end
end
