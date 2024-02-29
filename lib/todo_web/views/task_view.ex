defmodule TodoWeb.TaskView do
  use TodoWeb, :view

  def count_tasks(completed, tasks) do
    tasks
    |>Enum.count(fn task -> task.compleated == completed end)
  end

  def filter_tasks(params, tasks) do

    if Enum.empty?(params) do
      tasks
    else
      completed = String.to_existing_atom(params["compleated"])

      tasks
      |> Enum.filter(fn task -> task.compleated == completed end)
    end

  end
end
