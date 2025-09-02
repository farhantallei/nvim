return {
	{
		"github/copilot.vim",
		lazy = false,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {
			debug = false,
			window = {
				layout = "float",
				relative = "editor",
				border = "rounded",
			},
		},
		config = function(_, opts)
			local chat = require("CopilotChat")
			chat.setup(opts)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "CopilotChat",
				callback = function()
					vim.opt_local.foldenable = false
					vim.opt_local.foldexpr = ""
				end,
			})

			-- Shortcut: generate commit message
			vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChatCommit<cr>", { desc = "Copilot Commit Message" })
			-- Shortcut: jelaskan diff
			vim.keymap.set("n", "<leader>cd", "<cmd>CopilotChatExplain<cr>", { desc = "Copilot Explain Diff" })
		end,
	},
}
