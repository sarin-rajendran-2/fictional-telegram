defmodule Exins.Common.Contact.Types.AddressParts do
  use Ash.Type.NewType,
    subtype_of: :union,
    constraints: [
      types: [
        standard: [
          type: :struct,
          constraints: [instance_of: Exins.Common.Contact.Types.StandardAddress],
          tag: :type,
          tag_value: :standard
        ]
      ]
    ]
end