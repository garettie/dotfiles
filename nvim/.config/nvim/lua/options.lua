require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
o.rnu = true
-- Indenting
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
vim.diagnostic.config {
    virtual_text = false, -- or true, your call
    signs = true,
    underline = true,
    update_in_insert = false,
    float = { border = "rounded" },
}
