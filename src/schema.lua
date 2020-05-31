local typedefs = require "kong.db.schema.typedefs"

return {
    name = "kong-easter-eggs",
    fields = {
        { consumer = typedefs.no_consumer },
        { config = {
            type = "record",
            fields = {
                { make_me_header = { type = "string", default = "Make-Me" } },
                { dance_link = { type = "string", required = true } },
                { you_have_won_header = { type = "string", default = "You-Have-Won" } },
                { prize_frequency = { type = "number", default = 1000 } },
                { prizes = {
                    type = "array", elements = { type = "string" },
                } },
            },
        },
      },
    },
}
