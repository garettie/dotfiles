require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd

autocmd("VimEnter", {
    callback = function()
        local socket = vim.env.KITTY_LISTEN_ON
        if socket then
            vim.fn.system("kitty @ --to=" .. socket .. " set-spacing padding=0 margin=0")
        end
    end,
})

autocmd("VimLeavePre", {
    callback = function()
        local socket = vim.env.KITTY_LISTEN_ON
        if socket then
            vim.fn.system("kitty @ --to=" .. socket .. " set-spacing padding=0 margin=10")
        end
    end,
})

autocmd("BufDelete", {
    callback = function()
        local bufs = vim.t.bufs
        if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
            vim.cmd "Nvdash"
        end
    end,
})
