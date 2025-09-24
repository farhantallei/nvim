return {
	{
		"mason-org/mason.nvim",
		opts = {},
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"tailwindcss",
					"gopls",
					"docker_compose_language_service",
					"emmet_ls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
			lspconfig.docker_compose_language_service.setup({
				capabilities = capabilities,
			})

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
					vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {})
					vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, {})
					vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, {})
					vim.keymap.set("n", "<leader>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, {})
					vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, {})
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
					vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
					vim.keymap.set("n", "<leader>f", function()
						vim.lsp.buf.format({ async = true })
					end, {})
				end,
			})
		end,
	},
}
