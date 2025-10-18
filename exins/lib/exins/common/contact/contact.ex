defmodule Exins.Common.Contact do
  use Ash.Resource,
    domain: Exins.Common,
    data_layer: AshPostgres.DataLayer,
    extensions: [
      Ash.Resource.Dsl
    ]

  attributes do
    uuid_primary_key :id

    attribute :type, Exins.Common.Contact.Types.Type, allow_nil?: false

    attribute :names, {:array, Exins.Common.Contact.Types.Name}, allow_nil?: false
    attribute :phones, {:array, Exins.Common.Contact.Types.Phone}, allow_nil?: false
    attribute :addresses, {:array, Exins.Common.Contact.Types.Address}, allow_nil?: false
    attribute :emails, {:array, Exins.Common.Contact.Types.Email}, allow_nil?: false

    timestamps()
  end

  actions do
    defaults [:create, :read, :update, :destroy]
  end

  calculations do
    calculate :default_name, :string,
      expr(
        fragment(
          "(?)",
          from(n in subquery(from(c in __MODULE__, select: %{names: c.names})),
            join: u in fragment("unnest(?)", c.names),
            on: true,
            where: fragment("? @> ? OR ? IS NULL", u.tags, ["default"], u.tags),
            select: u.name_parts,
            limit: 1
          )
        )
      )

    calculate :default_phone, :string,
      expr(
        fragment(
          "(?)",
          from(p in subquery(from(c in __MODULE__, select: %{phones: c.phones})),
            join: u in fragment("unnest(?)", c.phones),
            on: true,
            where: fragment("? @> ? OR ? IS NULL", u.tags, ["default"], u.tags),
            select: u.phone_parts,
            limit: 1
          )
        )
      )

    calculate :default_address, :string,
      expr(
        fragment(
          "(?)",
          from(a in subquery(from(c in __MODULE__, select: %{addresses: c.addresses})),
            join: u in fragment("unnest(?)", c.addresses),
            on: true,
            where: fragment("? @> ? OR ? IS NULL", u.tags, ["default"], u.tags),
            select: u.address_parts,
            limit: 1
          )
        )
      )

    calculate :default_email, :string,
      expr(
        fragment(
          "(?)",
          from(e in subquery(from(c in __MODULE__, select: %{emails: c.emails})),
            join: u in fragment("unnest(?)", c.emails),
            on: true,
            where: fragment("? @> ? OR ? IS NULL", u.tags, ["default"], u.tags),
            select: u.email_address,
            limit: 1
          )
        )
      )
  end

  postgres do
    table "contacts"
    repo Exins.Repo
  end
end