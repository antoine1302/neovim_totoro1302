return {
    {
        "mason-org/mason.nvim",
        opts = {},
        config = function()
            require("mason").setup {
                firewall = {
                    enabled = true
                }
            }
        end
    },
    {
        {
            "mason-org/mason-lspconfig.nvim",
            opts = {},
            dependencies = {
                { "mason-org/mason.nvim", opts = {} },
                "neovim/nvim-lspconfig",
            },
        }
    }
}
