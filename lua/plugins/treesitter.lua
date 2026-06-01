return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        require("nvim-treesitter").install { 'bash', 'c', 'cpp', 'c_sharp', 'css', 'csv', 'dockerfile', 'dot', 'gitignore', 'go', 'gomod', 'gosum', 'gotmpl', 'gowork', 'groovy', 'hyprlang', 'jq', 'json', 'json5', 'lua', 'nix', 'php', 'phpdoc', 'rust', 'proto', 'sql', 'textproto', 'terraform', 'tmux', 'toml', 'xml', 'yaml', 'zsh', 'javascript'}

        vim.api.nvim_create_autocmd('FileType', {
            pattern = { 'bash', 'c', 'cpp', 'c_sharp', 'css', 'csv', 'lua', 'go', 'dockerfile', 'php', 'yaml', 'nix', 'proto', 'textproto', 'zsh', 'tmux', 'toml', 'xml', 'sql', 'rust', 'json' },
            callback = function() vim.treesitter.start() end,
        })
    end
}
