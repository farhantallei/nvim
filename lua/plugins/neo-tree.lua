return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
				},
				commands = {
					delete = function(state)
						local node = state.tree:get_node()
						local path = node.path
						local msg = "Are you sure you want to delete '" .. path .. "'?"

						local choice = vim.fn.confirm(msg, "&Yes\n&No", 2)

						if choice == 1 then
							vim.fn.system({ "trash", path })

							vim.schedule(function()
								require("neo-tree.sources.manager").refresh(state.name)
							end)
						end
					end,
				},
				window = {
					mappings = {
						["d"] = "delete",
					},
				},
			},
		})

		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})

		vim.keymap.set("n", "<leader>b", function()
			-- if neo-tree is open, close it. if it's closed, filesystem reveal left
			local is_open = false

			for _, win in pairs(vim.api.nvim_list_wins()) do
				local buf = vim.api.nvim_win_get_buf(win)
				local buf_ft = vim.api.nvim_buf_get_option(buf, "filetype")
				if buf_ft == "neo-tree" then
					is_open = true
					break
				end
			end

			if is_open then
				vim.cmd("Neotree close")
			else
				vim.cmd("Neotree filesystem reveal left")
			end
		end, {})

		vim.o.splitright = true

		vim.api.nvim_create_autocmd("WinClosed", {
			callback = function()
				vim.schedule(function()
					local wins = vim.api.nvim_list_wins()
					if #wins == 1 then
						local buf = vim.api.nvim_win_get_buf(wins[1])
						local bufname = vim.api.nvim_buf_get_name(buf)
						local ft = vim.bo[buf].filetype

						if bufname == "" and ft ~= "neo-tree" then
							vim.cmd("qa")
						end

						if ft == "neo-tree" then
							vim.cmd("vsplit | Alpha")
							vim.cmd("wincmd h")
							vim.cmd("vertical resize 40")
						end
					end
				end)
			end,
		})
	end,
}
