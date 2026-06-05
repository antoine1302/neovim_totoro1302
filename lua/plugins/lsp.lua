return {
    {
        "mason-org/mason.nvim",
        opts = {
            firewall = {
                enabled = true
            }
        }
    },
    {

        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "rust_analyzer", "gopls" },
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.lsp.enable("gopls")
            vim.lsp.enable("lua_ls")
            vim.lsp.enable("rust_analyzer")
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local opts = { buffer = event.buf, silent = true }
                    local builtin = require("telescope.builtin")
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
                    vim.keymap.set("n", "gr", builtin.lsp_references, opts)
                    vim.keymap.set("n", "gi", builtin.lsp_implementations, opts)
                end
            })
        end
    }
}
