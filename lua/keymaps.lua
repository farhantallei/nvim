-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", {})
vim.keymap.set("n", "<leader>o", ":call append(line('.'), '')<CR>")
vim.keymap.set("n", "<leader>O", ":call append(line('.')-1, '')<CR>")
