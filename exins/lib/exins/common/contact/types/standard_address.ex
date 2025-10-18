defmodule Exins.Common.Contact.Types.StandardAddress do
  use Ash.Resource,
    data_layer: :embedded,
    extensions: [
      Ash.Resource.Dsl
    ]

  attributes do
    attribute :street_address, Exins.Common.Contact.Types.StreetAddress, allow_nil?: false
    attribute :suburb, :string
    attribute :city, :string
    attribute :state, :string
    attribute :post_code, :string
    attribute :country, :string
  end

  calculations do
    calculate :full_address, :string, fn record, _ ->
      [
        (if is_list(record.street_address) do
           Enum.join(record.street_address, ", ")
         else
           record.street_address
         end),
        record.suburb,
        record.city,
        record.state,
        record.post_code,
        record.country
      ]
      |> Enum.reject(&is_nil/1)
      |> Enum.join(", ")
    end
  end
end