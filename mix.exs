defmodule CldrSql.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :cldr_sql,
      version: @version,
      elixir: "~> 1.10",
      name: "Cldr Sql Macros",
      source_url: "https://github.com/elixir-cldr/cldr_sql",
      docs: docs(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      test_coverage: [tool: ExCoveralls],
      aliases: aliases(),
      elixirc_paths: elixirc_paths(Mix.env()),
      dialyzer: [
        ignore_warnings: ".dialyzer_ignore_warnings",
        plt_add_apps: ~w(inets jason mix ecto ecto_sql eex)a
      ],
      compilers: Mix.compilers()
    ]
  end

  defp description do
    "Ecto functions and macros to localise ecto queries."
  end

  defp package do
    [
      maintainers: ["Kip Cole"],
      licenses: ["Apache-2.0"],
      links: %{
        "GitHub" => "https://github.com/elixir-cldr/cldr_sql",
        "Readme" => "https://github.com/elixir-cldr/cldr_sql/blob/v#{@version}/README.md",
        "Changelog" => "https://github.com/elixir-cldr/cldr_sql/blob/v#{@version}/CHANGELOG.md"
      },
      files: [
        "lib",
        "config",
        "mix.exs",
        "README.md",
        "CHANGELOG.md",
        "LICENSE.md"
      ]
    ]
  end

  if Mix.env() in [:dev, :test] do
    def application do
      [
        mod: {Cldr.Sql, [strategy: :one_for_one, name: Cldr.Sql.Supervisor]},
        extra_applications: [:logger]
      ]
    end
  else
    def application do
      [
        extra_applications: [:logger]
      ]
    end
  end

  def docs do
    [
      source_ref: "v#{@version}",
      extras: ["README.md", "CHANGELOG.md", "LICENSE.md"],
      main: "readme",
      logo: "logo.png",
      skip_undefined_reference_warnings_on: ["CHANGELOG.md", "README.md"]
    ]
  end

  defp aliases do
    [
      test: ["ecto.drop --quiet", "ecto.create --quiet", "ecto.migrate --quiet", "test"]
    ]
  end

  defp deps do
    [
      {:ex_cldr, "~> 2.29"},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:jason, "~> 1.0"},
      {:ecto, github: "kipcole9/ecto", branch: "fragment_escape", override: true},
      {:ecto_sql, "~> 3.0"},
      {:postgrex, "~> 0.15"},
      {:benchee, "~> 1.0", optional: true, only: :dev},
      {:ex_doc, "~> 0.22", only: [:dev, :test, :release]},
      {:earmark, "~> 1.4", only: [:dev, :test, :release]}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test", "mix", "test/support"]
  defp elixirc_paths(:dev), do: ["lib", "mix"]
  defp elixirc_paths(_), do: ["lib"]
end
