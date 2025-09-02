return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					-- Opsi tambahan jika pakai neo-tree di sebelah kiri
					offsets = {
						{
							filetype = "neo-tree",
							text = "File Explorer",
							highlight = "Directory",
							text_align = "left",
						},
					},
					diagnostics = "nvim_lsp",
					separator_style = "slant", -- bisa diganti 'thin', 'slant', 'padded_slant', dll
					show_close_icon = false,
					show_buffer_close_icons = false,
				},
			})

			vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
			vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
		end,
	},
	{
		"kazhala/close-buffers.nvim",
		config = function()
			vim.keymap.set("n", "<leader>bo", function()
				require("close_buffers").delete({ type = "other" })
			end, { desc = "Close other buffers" })

			vim.keymap.set("n", "<leader>ba", function()
				require("close_buffers").delete({ type = "all" })
			end, { desc = "Close all buffers" })

			vim.keymap.set("n", "<leader>bd", function()
				require("close_buffers").delete({ type = "this" })
			end, { desc = "Close current buffer" })
		end,
	},
}
