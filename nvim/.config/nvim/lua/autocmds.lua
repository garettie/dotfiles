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
      vim.fn.system("kitty @ --to=" .. socket .. " set-spacing padding=10 margin=10")
    end
  end,
})
