defmodule Exins.Common.Contact.Types.PhoneParts do
  use Ash.Type.NewType,
    subtype_of: :union,
    constraints: [
      types: [
        simple: [
          type: :struct,
          constraints: [instance_of: Exins.Common.Contact.Types.PhoneSimple],
          tag: :type,
          tag_value: :simple
        ],
        full: [
          type: :struct,
          constraints: [instance_of: Exins.Common.Contact.Types.PhoneFull],
          tag: :type,
          tag_value: :full
        ]
      ]
    ]
end