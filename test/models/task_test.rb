require "test_helper"

class TaskTest < ActiveSupport::TestCase
  def setup
    @task = Task.new(title: "Example Task", deadline: "Mon, 01 Jan 2023")
  end

  test "should be valid" do
    assert @task.valid?
  end

  test "title should be present" do
    @task.title = ""
    assert_not @task.valid?
  end

  test "deadline should be present" do
    @task.deadline = "     "
    assert_not @task.valid?
  end
end
