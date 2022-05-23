defmodule Cldr.Repo do
  use Ecto.Repo,
    otp_app: :cldr_sql,
    adapter: Ecto.Adapters.Postgres

end

