require 'test_helper'

class TaskEditTest < ActionDispatch::IntegrationTest
  def setup
    @task = Task.create!(title: "test_task",
      start_date: "2021/1/1",
      end_date: "2021/12/31",
      memo: "testmemo"
      )
  end

  test "編集成功のテスト" do
    get edit_task_path(@task)
    assert_template "tasks/edit"
    title = "編集テスト"
    start_date = "2021/4/1"
    end_date = "2021/4/30"
    memo = "編集機能のテスト"
    patch task_path(@task), params: { task: { title: title,
                                              start_date: start_date,
                                              end_date: end_date,
                                              memo: memo
    } }
    assert_not flash.empty?
    assert_redirected_to tasks_path
    @task.reload
    assert_equal "編集テスト", @task.title
    assert_equal "編集機能のテスト", @task.memo
  end

  test "編集失敗のテスト" do
    get edit_task_path(@task)
    assert_template "tasks/edit"
    patch task_path(@task), params: { task: { title: "",
                                              start_date: "",
                                              end_date: "",
                                              memo: ""
    } }
    assert_template "tasks/edit"
    assert_select "div.field_with_errors"
  end
end
