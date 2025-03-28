# frozen_string_literal: true

require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get tasks_url
    assert_response :success
  end

  test 'should get new' do
    get new_task_url
    assert_response :success
  end

  test 'should create task' do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { name: 'Task 1', status: 'new', creator: 'User 1', completed: false } }
    end

    assert_redirected_to task_url(Task.last)
  end

  test 'should show task' do
    task = Task.create!(name: 'Task 1', status: 'new', creator: 'User 1', completed: false)
    get task_url(task)
    assert_response :success
  end

  test 'should get edit' do
    task = Task.create!(name: 'Task 1', status: 'new', creator: 'User 1', completed: true)
    get edit_task_url(task)
    assert_response :success
  end
end

# 0f491dda97dc076994c443d01eedeedbea487f7a2d44db0eedceb4c6afeeaef8b7fa6c41f4479796463acf6d0ad177dae93e5fe4667c7f98ced7a09d72bf0f7c
