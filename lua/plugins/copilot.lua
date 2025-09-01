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

			-- Shortcut: generate commit message
			vim.keymap.set("n", "<leader>cc", "<cmd>CopilotChatCommit<cr>", { desc = "Copilot Commit Message" })
			-- Shortcut: jelaskan diff
			vim.keymap.set("n", "<leader>cd", "<cmd>CopilotChatExplain<cr>", { desc = "Copilot Explain Diff" })
		end,
	},
}
