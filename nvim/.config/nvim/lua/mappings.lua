require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
vim.api.nvim_create_autocmd("FileType", {
    pattern = "NvimTree",
    callback = function()
        local api = require "nvim-tree.api"
        local opts = { buffer = true, silent = true }
        map("n", "l", api.node.open.edit, opts)
        map("n", "h", api.node.navigate.parent_close, opts)
    end,
})

-- Keyboard users
map("n", "<C-t>", function()
    require("menu").open "default"
end, {})

-- mouse users + nvimtree users!
map({ "n", "v" }, "<RightMouse>", function()
    require("menu.utils").delete_old_menus()

    vim.cmd.exec '"normal! \\<RightMouse>"'

    -- clicked buf
    local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
    local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

    require("menu").open(options, { mouse = true })
end, {})

map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
