return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"ahmedkhalf/project.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope-ui-select.nvim", -- pindah ke dependencies
		},
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")

			-- Setup project.nvim
			require("project_nvim").setup({
				detection_methods = { "pattern", "lsp" },
				patterns = { ".git", "package.json", "Makefile", "pyproject.toml" },
			})

			-- Setup telescope
			telescope.setup({
				defaults = {
					file_ignore_patterns = { "node_modules", ".git/" },
				},
				extensions = {
					projects = {},
					["ui-select"] = require("telescope.themes").get_dropdown({}),
					git_commits = {
						attach_mappings = function(prompt_bufnr, map)
							actions.select_default:replace(function()
								local entry = action_state.get_selected_entry()
								actions.close(prompt_bufnr)
								-- Pastikan Diffview sudah terinstall
								vim.cmd("DiffviewOpen " .. entry.value)
							end)
							return true
						end,
					},
					git_status = {
						attach_mappings = function(prompt_bufnr, _)
							actions.select_default:replace(function()
								local entry = action_state.get_selected_entry()
								actions.close(prompt_bufnr)
								-- Buka file yang dipilih di Diffview
								vim.cmd("DiffviewOpen")
							end)
							return true
						end,
					},
				},
			})

			-- Load all extensions
			telescope.load_extension("projects")
			telescope.load_extension("ui-select")

			-- Keymaps
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})
			vim.keymap.set("n", "<leader>fo", function()
				builtin.oldfiles({ cwd = vim.loop.cwd(), only_cwd = true })
			end, {})
			vim.keymap.set("n", "<leader>fp", telescope.extensions.projects.projects, {})
			vim.keymap.set("n", "<leader>xx", builtin.diagnostics, {})

			-- Baru: Git-related pickers
			vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Telescope Git Commits" })
			vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Telescope Git Status" })
		end,
	},
}
