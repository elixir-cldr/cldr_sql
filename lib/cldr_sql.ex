defmodule Cldr.Sql do
  def start(_, _) do
    children = [
      Cldr.Repo,
    ]

    opts = [strategy: :one_for_one, name: Cldr.Sql.Supervisor]
    Supervisor.start_link(children, opts)
  end


  defmacro collate(column) do
    {{:., _, [{table_alias, _, _}, _column_name]}, _, []} = column
    table_alias = [{table_alias, [], nil}]
    quote do
      dynamic([m], fragment(unquote("? COLLATE ?"), unquote(column), Cldr.get_locale()))
    end
  end

end
