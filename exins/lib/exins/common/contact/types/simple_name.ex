defmodule Exins.Common.Contact.Types.SimpleName do
  use Ash.Resource,
    data_layer: :embedded,
    extensions: [
      Ash.Resource.Dsl
    ]

  attributes do
    attribute :first_name, :string, allow_nil?: false
    attribute :last_name, :string, allow_nil?: false
  end

  calculations do
    calculate :full_name, :string, expr(first_name <> " " <> last_name)
  end
end