defmodule Cldr.Model do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "models" do
    field :name,         :string
    field :amount,       :integer
    timestamps()
  end

  def changeset(organization, params \\ %{}) do
    organization
    |> cast(params, [:amout])
  end
end