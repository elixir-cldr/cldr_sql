defmodule Q do
  import Ecto.Query
  alias Cldr.Model

  defmacrop collate(column) do
    quote do
      fragment("? COLLATE \"?\"", unquote(column), type(^Q.collation(), :unsafe!))
    end
  end

  def collation do
    cldr = Cldr.get_locale().cldr_locale_name
    "#{cldr}-x-icu"
  end

  def q() do
    from m in Model,
      select: m.name,
      where: m.name == "Kip",
      order_by: ^[
        asc: dynamic([m], fragment("? COLLATE \"?\"", m.name, type(^collation(), :unsafe!))),
        desc: dynamic([m], collate(m.name))
      ]
  end

end