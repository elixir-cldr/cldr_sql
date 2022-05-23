defmodule Cldr.Repo.Migrations.CreateModel do
  use Ecto.Migration

  def change do
    create table(:models) do
      add :name,            :string
      add :amount,          :integer
      timestamps()
    end
  end
end
