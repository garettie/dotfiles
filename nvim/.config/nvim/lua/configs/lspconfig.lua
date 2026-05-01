require("nvchad.configs.lspconfig").defaults()

<<<<<<< HEAD
local servers =
    { "html", "cssls", "vtsls", "jsonls", "emmet_language_server", "tailwindcss", "eslint-lsp", "basedpyright" }
vim.lsp.enable(servers)
=======
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
>>>>>>> e25ec50 (noctalia update)

vim.lsp.enable(servers)
