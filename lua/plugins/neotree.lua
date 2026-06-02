return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            filesystem = {
                use_libuv_file_watcher = true,
                filtered_items = {
                    visible = true,
                    never_show = {
                        ".DS_Store",
                        "thumbs.db",
                        ".git",
                    },
                },
                follow_current_file = {
                    enabled = true,
                },
            },
            window = {
                position = "left",
                width = 40,
            },
        })
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                require("neo-tree.command").execute({
                    toggle = false,
                    dir = vim.loop.cwd(),
                })
                vim.keymap.set('n', '<leader>n', ":Neotree toggle<CR>", { silent = true })
            end,
        })
    end
}
