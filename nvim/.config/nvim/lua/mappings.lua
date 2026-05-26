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

-- move format from <leader>fm to <leader>cf
pcall(vim.keymap.del, "n", "<leader>fm")
pcall(vim.keymap.del, "x", "<leader>fm")
map({ "n", "x" }, "<leader>cf", function()
    require("conform").format { lsp_fallback = true }
end, { desc = "format file" })

-- move diagnostics loclist from <leader>ds to <leader>cl
pcall(vim.keymap.del, "n", "<leader>ds")
map("n", "<leader>cl", vim.diagnostic.setloclist, { desc = "code loclist" })

-- move marks from <leader>ma to <leader>fm (find marks)
pcall(vim.keymap.del, "n", "<leader>ma")
map("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "find marks" })

-- git
map("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "git lazygit" })
map("n", "<leader>gb", function()
    require("gitsigns").blame_line()
end, { desc = "git blame" })
map("n", "<leader>gd", function()
    require("gitsigns").diffthis()
end, { desc = "git diff" })
map("n", "<leader>gj", function()
    require("gitsigns").next_hunk()
end, { desc = "git next hunk" })
map("n", "<leader>gk", function()
    require("gitsigns").prev_hunk()
end, { desc = "git prev hunk" })
map("n", "<leader>gp", function()
    require("gitsigns").preview_hunk()
end, { desc = "git preview hunk" })

-- move relative numbers from <leader>rn to <leader>ur
pcall(vim.keymap.del, "n", "<leader>rn")
map("n", "<leader>ur", "<cmd>set rnu!<CR>", { desc = "ui toggle relative numbers" })

-- ui toggles
map("n", "<leader>uw", function()
    vim.wo.wrap = not vim.wo.wrap
end, { desc = "ui toggle wrap" })
map("n", "<leader>us", function()
    vim.wo.spell = not vim.wo.spell
end, { desc = "ui toggle spell" })
map("n", "<leader>ud", function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = "ui toggle diagnostics" })

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspMappings", { clear = true }),
    callback = function(ev)
        local bufopts = { buffer = ev.buf }

        pcall(vim.keymap.del, "n", "<leader>ra", bufopts)
        pcall(vim.keymap.del, "n", "<leader>wa", bufopts)
        pcall(vim.keymap.del, "n", "<leader>wr", bufopts)
        pcall(vim.keymap.del, "n", "<leader>wl", bufopts)

        vim.keymap.set("n", "<leader>lr", require("nvchad.lsp.renamer"),
            vim.tbl_extend("force", bufopts, { desc = "LSP rename" }))
        vim.keymap.set("n", "<leader>la", vim.lsp.buf.add_workspace_folder,
            vim.tbl_extend("force", bufopts, { desc = "LSP add workspace folder" }))
        vim.keymap.set("n", "<leader>ld", vim.lsp.buf.remove_workspace_folder,
            vim.tbl_extend("force", bufopts, { desc = "LSP remove workspace folder" }))
        vim.keymap.set("n", "<leader>ll", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, vim.tbl_extend("force", bufopts, { desc = "LSP list workspace folders" }))

        -- code actions
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,
            vim.tbl_extend("force", bufopts, { desc = "LSP code action" }))
        vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float,
            vim.tbl_extend("force", bufopts, { desc = "LSP line diagnostics" }))
    end,
})
