defmodule Exins.Common.Contact.Types.PhoneSimple do
  use Ash.Resource,
    data_layer: :embedded,
    extensions: [
      Ash.Resource.Dsl
    ]

  attributes do
    attribute :country_code, :string
    attribute :phone_number, :string, allow_nil?: false
  end

  calculations do
    calculate :full_phone_number, :string, fn record, _ ->
      [record.country_code, record.phone_number]
      |> Enum.reject(&is_nil/1)
      |> Enum.join(" ")
    end
  end
end