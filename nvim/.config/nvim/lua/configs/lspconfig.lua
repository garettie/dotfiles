require("nvchad.configs.lspconfig").defaults()

local servers =
    { "html", "cssls", "vtsls", "jsonls", "emmet_language_server", "tailwindcss", "eslint-lsp", "basedpyright" }
vim.lsp.enable(servers)

local servers = {
    "html",
    "cssls",
    "emmet_language_server",
    "tsgo",
    "eslint",
    "jsonls",
    "tailwindcss",
    "taplo",
    "basedpyright",
    "bashls",
    "lua_ls",
    "marksman",
    "rust_analyzer",
}

vim.lsp.enable(servers)
