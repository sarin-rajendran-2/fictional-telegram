defmodule Exins.Common do
  use Ash.Domain,
    extensions: [
      Ash.Domain.Dsl.Extension
    ]

  resources do
    resource Exins.Common.Contact
  end
end