defmodule Exins.Common.Contact.Types.FullName do
  use Ash.Resource,
    data_layer: :embedded,
    extensions: [
      Ash.Resource.Dsl
    ]

  attributes do
    attribute :title, :string
    attribute :first_name, :string, allow_nil?: false
    attribute :middle_name, :string
    attribute :last_name, :string, allow_nil?: false
    attribute :suffix, :string
  end

  calculations do
    calculate :full_name, :string, fn record, _ ->
      [record.title, record.first_name, record.middle_name, record.last_name, record.suffix]
      |> Enum.reject(&is_nil/1)
      |> Enum.join(" ")
    end
  end
end