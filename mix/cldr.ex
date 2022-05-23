defmodule Cldr.Sql.Cldr do
  use Cldr,
    locales: ["en", "fr", "se", "de", "ja"],
    default_locale: "en",
    providers: []

end