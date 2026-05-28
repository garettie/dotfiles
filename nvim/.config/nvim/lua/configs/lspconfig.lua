require("nvchad.configs.lspconfig").defaults()

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
