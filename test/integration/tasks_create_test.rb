require "test_helper"

class TasksCreateTest < ActionDispatch::IntegrationTest
  
  test "invalid task creation" do
    get root_path
    assert_no_difference 'Task.count' do
      post tasks_path, params: { task: { title:  "",
                                         deadline: "" } }
    end
    assert_response :unprocessable_entity
    assert_template '/'
    assert_not flash.empty?
  end

  test "valid task creation" do
    assert_difference 'Task.count' do
      post tasks_path, params: { task: { title: "Example Task",
                                 deadline: "Mon, 01 Jan 2023" } }
    end
    follow_redirect!
    assert_template '/'
    assert_not flash.empty?
  end
end
