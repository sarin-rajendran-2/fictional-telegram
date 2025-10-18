defmodule Exins.Common.Contact.Types.StreetAddress do
  use Ash.Type.NewType,
    subtype_of: :union,
    constraints: [
      types: [
        string: [
          type: :string
        ],
        string_array: [
          type: {:array, :string}
        ]
      ]
    ]
end