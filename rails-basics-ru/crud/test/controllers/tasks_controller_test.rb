require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { name: 'Task 1', status: 'new', creator: 'User 1', completed: false } }
    end

    assert_redirected_to task_url(Task.last)
  end

  test "should show task" do
    task = Task.create!(name: 'Task 1', status: 'new', creator: 'User 1', completed: false)
    get task_url(task)
    assert_response :success
  end

  test "should get edit" do
    task = Task.create!(name: 'Task 1', status: 'new', creator: 'User 1', completed: false)
    get edit_task_url(task)
    assert_response :success
  end
end
