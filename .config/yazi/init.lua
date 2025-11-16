-- pdf preview (requires poppler)
-- NOTE: need to install package (brew install poppler)

-- toggle preview pane
-- NOTE: need to install package (ya pkg add yazi-rs/plugins:toggle-pane)

-- show full border
-- NOTE: need to install plugin (ya pkg add yazi-rs/plugins:full-border)
require("full-border"):setup {
    type = ui.Border.PLAIN, -- [ui.Border.PLAIN, ui.Border.ROUNDED]
}

-- show user/group of files in status bar
Status:children_add(function()
    local h = cx.active.current.hovered
    if not h or ya.target_family() ~= "unix" then
        return ""
    end

    return ui.Line {
        ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
        ":",
        ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
        " ",
    }
end, 500, Status.RIGHT)
