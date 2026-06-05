-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.clipboard = "unnamedplus"
opt.termguicolors = true
opt.cmdheight = 0

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.fn.system("hyprctl dispatch setprop active opaque toggle")
  end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    vim.fn.system("hyprctl dispatch setprop active opaque toggle")
  end,
})

