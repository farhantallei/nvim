-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.scrolloff = 10
opt.sidescrolloff = 10
opt.wrap = true

vim.g.lazyvim_prettier_needs_config = true
vim.cmd("set completeopt+=noselect")

-- opt.timeout = false
-- opt.ttimeout = true
-- opt.timeoutlen = 300
-- opt.ttimeoutlen = 10
--
-- opt.lazyredraw = true
-- opt.termguicolors = true
