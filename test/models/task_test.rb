require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  def setup 
    @task = Task.new(title: "test_task",
                    start_date: "2021/1/1",
                    end_date: "2021/12/31"
                    )
  end

  test "正しいデータであれば有効なこと" do
    assert @task.valid?
  end

  test "タイトルが空文字のデータは無効なこと" do
    @task.title = ""
    assert @task.invalid?
  end

  test "タイトルの長さが50文字以下のデータは有効なこと" do
    @task.title = "a" * 50
    assert @task.valid?
  end

  test "タイトルの長さが51文字以上のデータは無効なこと" do
    @task.title = "a" * 51
    assert @task.invalid?
  end

  test "開始日が空のデータは無効なこと" do
    @task.start_date = ""
    assert @task.invalid?
  end

  test "終了日が空のデータは無効なこと" do
    @task.end_date = ""
    assert @task.invalid?
  end
end
