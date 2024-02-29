defmodule TodoWeb.TaskViewTest do
  use TodoWeb.ConnCase, async: true
  import Todo.TasksFixtures
  alias TodoWeb.TaskView
  test"count_tasks/2 returns count of tasks where completed" do
    tasks = [
      %{text: "first", compleated: true},
      %{text: "first", compleated: false},
      %{text: "first", compleated: false}
    ]

    assert 1 = TaskView.count_tasks(true, tasks)
  end





  test"count_tasks/2 returns count of tasks where not completed" do
    tasks = [
      %{text: "first", compleated: true},
      %{text: "first", compleated: false},
      %{text: "first", compleated: false}
    ]

    assert 2 = TaskView.count_tasks(false, tasks)
  end



  describe "filter_tasks/2" do
    setup [:create_tasks]

    test "list tasks", %{tasks: tasks} do
      params = %{}

      assert tasks == TaskView.filter_tasks(params, tasks)
    end

    test "returns active tasks", %{tasks: tasks} do
      params = %{"compleated"=> "false"}
      active_tasks = Enum.take(tasks, 2)

      assert active_tasks == TaskView.filter_tasks(params, tasks)
    end



    test "returns completed tasks", %{tasks: tasks} do
      params = %{"compleated"=> "true"}
      completed_tasks = [List.last(tasks)]

      assert completed_tasks == TaskView.filter_tasks(params, tasks)
    end
  end


  defp create_tasks(_) do
    tasks = tasks_fixtures()
    %{tasks: tasks}
  end
end
