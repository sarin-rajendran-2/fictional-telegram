defmodule Exins.Common.Contact.Types.Email do
  use Ash.Resource,
    data_layer: :embedded,
    extensions: [
      Ash.Resource.Dsl
    ]

  attributes do
    attribute :email_address, :string, allow_nil?: false
    attribute :tags, {:array, :string}
  end
end