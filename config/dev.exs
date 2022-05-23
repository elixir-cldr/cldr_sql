import Config

config :cldr_sql, Cldr.Repo,
  username: "kip",
  database: "cldr_sql",
  hostname: "localhost"

config :cldr_sql,
  ecto_repos: [Cldr.Repo]

config :ex_cldr,
  default_backend: Cldr.Sql.Cldr

