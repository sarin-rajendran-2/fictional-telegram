defmodule Exins.Common.Contact.Types.Type do
  use Ash.Type.Enum, values: [:individual, :organization]
end