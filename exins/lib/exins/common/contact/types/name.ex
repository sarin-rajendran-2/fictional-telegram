defmodule Exins.Common.Contact.Types.Name do
  use Ash.Resource,
    data_layer: :embedded,
    extensions: [
      Ash.Resource.Dsl
    ]

  attributes do
    attribute :name_parts, Exins.Common.Contact.Types.NameParts, allow_nil?: false
    attribute :tags, {:array, :string}
  end
end