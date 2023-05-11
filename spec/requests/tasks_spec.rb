require 'rails_helper'

RSpec.describe "TasksController", type: :request do
  describe 'POST #create' do
    context "valid task creation" do
      it "creates new task " do
        expect{
          post tasks_path, params: { task: attributes_for(:task) }
        }.to change(Task, :count).by(1)
      end
      it "redirects to root_path" do
        post tasks_path, params: { task: attributes_for(:task) }
        expect(response).to redirect_to root_path
      end
    end

    context "invalid task creation" do 
      let(:task_params) do
        attributes_for(:task, title: nil,
                              deadline: nil)
      end
      it "doesn not create new task" do
        expect{
          post tasks_path, params: { task: task_params }
        }.to_not change(Task, :count)
      end
      it "redirects to root_path" do 
        post tasks_path, params: { task: task_params }
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'POST #done' do
    it "update done_at" do
        post done_task_path, params: { task_done: attributes_for(:task, :done) }
        expect(task.done_at).not_to eq nil
    end
  end
end

