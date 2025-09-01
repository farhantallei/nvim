-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", {})
vim.keymap.set("n", "<leader>o", ":call append(line('.'), '')<CR>")
vim.keymap.set("n", "<leader>O", ":call append(line('.')-1, '')<CR>")

-- Floating window on error
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

-- Navigasi antar error
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

-- di config Neovim (init.lua)
vim.keymap.set("t", "<A-Left>", [[<C-\><C-n>i<Esc>b]], { noremap = true })
vim.keymap.set("t", "<A-Right>", [[<C-\><C-n>i<Esc>f]], { noremap = true })
-- Hapus kata ke kiri (⌥⌫)
vim.keymap.set("t", "<A-BS>", [[<C-\><C-n>i<C-w>]], { noremap = true })
-- Hapus kata ke kanan (⌥d)
vim.keymap.set("t", "<A-d>", [[<C-\><C-n>i<Esc>daw]], { noremap = true })
