defmodule Todo.TasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todo.Tasks` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        text: "some text",
        compleated: true
      })
      |> Todo.Tasks.create_task()

    task
  end

  def tasks_fixtures(attrs \\ %{}) do
    {:ok, task1} =
      attrs
      |> Enum.into(%{
        compleated: false,
        text: "somthing"
      })
      |> Todo.Tasks.create_task()


    {:ok, task2} =
      attrs
      |> Enum.into(%{
        compleated: false,
        text: "somthing2"
      })
      |> Todo.Tasks.create_task()

    {:ok, task3} =
      attrs
      |> Enum.into(%{
        compleated: true,
        text: "somthing3"
      })
      |> Todo.Tasks.create_task()

    [task2, task1, task3]
  end
end
