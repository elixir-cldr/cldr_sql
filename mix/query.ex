defmodule Cldr.Sql.Query do
  import Ecto.Query
  alias Cldr.Model

  # A macro to build a fragment for applying
  # a collation to a column in an ORDER BY
  # clause.

  defmacrop collate(column, locale) do
    quote do
      fragment("? COLLATE \"?\"", unquote(column),
        escape!(^collation(unquote(locale))))
    end
  end

  @doc """
  Returns the Postgres ICU-based collation name
  for a given Cldr locale.

  """
  def collation(locale) do
    "#{locale.cldr_locale_name}-x-icu"
  end

  @doc """
  Interpolate the collation into the query
  which is not otherwise possible with Ecto
  because Postgres does not allow parameter
  interpoliation for identifiers (like table
  names and collation names). Only text
  replacement works.
  """
  def order_by(locale \\ Cldr.get_locale()) do
    from m in Model,
      select: m.name,
      order_by: [
        asc: fragment("? COLLATE \"?\"", m.name, escape!(^collation(locale))),
        desc: collate(m.name, Cldr.get_locale())
      ]
  end

  @doc """
  Interpolate a table name into an "exists" subquery.

  """
  def exists(schema \\ "models") do
    from(m in Model,
      select: m.name,
      where: fragment("exists (SELECT 1 FROM \"?\" o WHERE o.name = ?)", escape!(^schema), m.name))
  end
end