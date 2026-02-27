-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Neogit
vim.keymap.set("n", "<leader>gG", "<cmd>Neogit<CR>", { desc = "Open Neogit" })

-- Mini Map
-- vim.keymap.set("n", "<leader>mm", require("mini.map").toggle, { desc = "Toggle Minimap" })
-- vim.keymap.set("n", "<leader>mf", require("mini.map").toggle_focus, { desc = "Focus Minimap" })
-- vim.keymap.set("n", "<leader>ms", require("mini.map").toggle_side, { desc = "Toggle Minimap Side" })
-- vim.keymap.set("n", "<leader>mr", require("mini.map").refresh, { desc = "Refresh Minimap" })

-- Open Dashboard
vim.keymap.set("n", "<leader>od", function()
  Snacks.dashboard()
end, { desc = "Open Dashboard" })

-- LSP
vim.keymap.set("n", "<leader>cx", "<cmd>LspRestart<CR>", { desc = "Restart LSP" })

-- Vim Test
vim.keymap.set("n", "<leader>tt", ":TestNearest<CR>", {})
vim.keymap.set("n", "<leader>tT", ":TestFile<CR>", {})
vim.keymap.set("n", "<leader>ta", ":TestSuite<CR>", {})
vim.keymap.set("n", "<leader>tl", ":TestLast<CR>", {})
vim.keymap.set("n", "<leader>tg", ":TestVisit<CR>", {})

-- Bufferline
for i = 1, 9 do
  vim.keymap.set("n", "<leader>" .. i, "<cmd>BufferLineGoToBuffer " .. i .. "<CR>", { desc = "Go to buffer " .. i })
end

-- Copy full path of current file
vim.keymap.set("n", "<leader>yp", function()
  vim.fn.setreg("+", vim.fn.expand("%:."))
end, { desc = "Copy full file path" })

-- Copy directory of current file
vim.keymap.set("n", "<leader>yd", function()
  vim.fn.setreg("+", vim.fn.expand("%:.:h"))
end, { desc = "Copy file directory" })
