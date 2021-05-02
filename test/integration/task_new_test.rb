require 'test_helper'

class TaskNewTest < ActionDispatch::IntegrationTest
  test "新規タスク作成成功のテスト" do
    get new_task_path
    assert_template "tasks/new"
    assert_difference "Task.count", 1 do
      post tasks_path, params: {task: { title: "Test Task",
                                        start_date: "2021/1/29",
                                        end_date: "2021/1/31",
                                        memo: "test_memo" } }
      end
    assert_not flash.empty?
    assert_redirected_to tasks_path
  end

  test "新規タスク作成失敗のテスト" do
    get new_task_path
    assert_template "tasks/new"
    assert_no_difference "Task.count" do
      post tasks_path, params: {task: { title: "",
                                        start_date: "",
                                        end_date: "",
                                        memo: "test_memo" } }
      end
    assert_template "tasks/new"
    assert_select "div.field_with_errors"
  end
end
