-- lua/plugins/rose-pine.lua
return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      highlight_groups = {
        Normal = { bg = "#17151f" }, -- default Rose Pine base
        NormalNC = { bg = "#17151f" }, -- inactive windows
        NormalFloat = { bg = "#17151f" }, -- floating windows
      },
    })
    vim.cmd("colorscheme rose-pine")
  end,
}
