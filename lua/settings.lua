-- General UI settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showcmd = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

-- Folding
vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 99

-- Clipboard
vim.clipboard = "unnamedplus"

-- Files & Swap
vim.opt.swapfile = false

-- Indentation
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true

-- Scrolling
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Backspace behavior
vim.opt.backspace = "indent,eol,start"

-- Line wrapping
vim.opt.wrap = true

-- Leaders
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- vim.g.background = "light"

-- UI: Transparent background (optional)
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Optional window-specific override (redundant with vim.opt.number)
vim.wo.number = true
