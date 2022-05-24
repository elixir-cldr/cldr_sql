defmodule Cldr.Sql do
  def start(_, _) do
    children = [
      Cldr.Repo,
    ]

    opts = [strategy: :one_for_one, name: Cldr.Sql.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
