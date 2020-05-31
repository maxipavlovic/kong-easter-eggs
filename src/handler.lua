local BasePlugin = require "kong.plugins.base_plugin"
local access = require "kong.plugins.kong-easter-eggs.access"
local header_filter = require "kong.plugins.kong-easter-eggs.header_filter"


local EasterEggs = BasePlugin:extend()


EasterEggs.VERSION  = "1.0.0"
EasterEggs.PRIORITY = 2020


function EasterEggs:new()
    EasterEggs.super.new(self, "kong-easter-eggs")
end

function EasterEggs:access(config)
    EasterEggs.super.access(self)

    access.execute(config)
end

function EasterEggs:header_filter(config)
    EasterEggs.super.header_filter(self)

    header_filter.execute(config)
end

return EasterEggs
