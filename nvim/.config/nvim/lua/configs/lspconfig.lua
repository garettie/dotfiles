require("nvchad.configs.lspconfig").defaults()

local servers =
    { "html", "cssls", "vtsls", "jsonls", "emmet_language_server", "tailwindcss", "eslint-lsp", "basedpyright" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
