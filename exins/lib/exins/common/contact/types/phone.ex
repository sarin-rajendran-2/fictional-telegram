defmodule Exins.Common.Contact.Types.Phone do
  use Ash.Resource,
    data_layer: :embedded,
    extensions: [
      Ash.Resource.Dsl
    ]

  attributes do
    attribute :phone_parts, Exins.Common.Contact.Types.PhoneParts, allow_nil?: false
    attribute :format_mask, :atom
    attribute :tags, {:array, :string}
  end

  calculations do
    calculate :full_phone_number, :string,
      expr(fragment("?", phone_parts.full_phone_number))
  end
end