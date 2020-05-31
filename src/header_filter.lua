local _M = {}

function _M.execute(config)
    local requests_count, _ = ngx.shared.kong:incr("requests_count", 1, 0)
    if requests_count == nil or requests_count % config.prize_frequency ~= 0 then
        return
    end

    local prizes = config.prizes
    if prizes == nil or next(prizes) == nil then
        return
    end

    local upstream_status = kong.service.response.get_status()
    if upstream_status and upstream_status > 399 then
        return
    end

    kong.response.set_header(config.you_have_won_header, prizes[math.random(#prizes)])
end

return _M