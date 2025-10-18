defmodule Exins.Common.Contact.Types.Address do
  use Ash.Resource,
    data_layer: :embedded,
    extensions: [
      Ash.Resource.Dsl
    ]

  attributes do
    attribute :address_parts, Exins.Common.Contact.Types.AddressParts, allow_nil?: false
    attribute :tags, {:array, :string}
  end

  calculations do
    calculate :full_address, :string,
      expr(fragment("?", address_parts.full_address))
  end
end