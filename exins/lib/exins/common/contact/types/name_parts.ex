defmodule Exins.Common.Contact.Types.NameParts do
  use Ash.Type.NewType,
    subtype_of: :union,
    constraints: [
      types: [
        organization: [
          type: :struct,
          constraints: [instance_of: Exins.Common.Contact.Types.OrganizationName],
          tag: :type,
          tag_value: :organization
        ],
        simple: [
          type: :struct,
          constraints: [instance_of: Exins.Common.Contact.Types.SimpleName],
          tag: :type,
          tag_value: :simple
        ],
        full: [
          type: :struct,
          constraints: [instance_of: Exins.Common.Contact.Types.FullName],
          tag: :type,
          tag_value: :full
        ]
      ]
    ]
end