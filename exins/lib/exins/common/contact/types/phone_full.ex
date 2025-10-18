defmodule Exins.Common.Contact.Types.PhoneFull do
  use Ash.Resource,
    data_layer: :embedded,
    extensions: [
      Ash.Resource.Dsl
    ]

  attributes do
    attribute :country_code, :string
    attribute :area_code, :string
    attribute :phone_number, :string, allow_nil?: false
    attribute :extension, :string
  end

  calculations do
    calculate :full_phone_number, :string, fn record, _ ->
      [record.country_code, record.area_code, record.phone_number, record.extension]
      |> Enum.reject(&is_nil/1)
      |> Enum.join(" ")
    end
  end
end