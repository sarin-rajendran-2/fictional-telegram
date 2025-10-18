defmodule Exins.Common.Contact.Types.OrganizationName do
  use Ash.Resource,
    data_layer: :embedded,
    extensions: [
      Ash.Resource.Dsl
    ]

  attributes do
    attribute :name, :string, allow_nil?: false
  end

  calculations do
    calculate :full_name, :string, fn record, _ -> record.name end
  end
end