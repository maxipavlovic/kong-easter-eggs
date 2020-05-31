local _M = {}

function _M.execute(config)
    local http_method = kong.request.get_method()
    if not (http_method == "GET" or http_method == "HEAD") then
        return
    end

    local action = kong.request.get_header(config.make_me_header)
    if action == nil or action == "" then
        return
    end

    if string.lower(action) == "dance" then
        kong.response.set_header("Location", config.dance_link)
        kong.response.exit(302)
    else
        kong.response.exit(418, "I'm a teapot. I can't make you " .. action .. "!")
    end
end

return _M
