return {
  "windwp/nvim-ts-autotag",
  event = "InsertEnter",
  opts = {
		enable_close = true,
		enable_rename = true,
		enable_close_on_slash = false,
	},
  config = function()
    require("nvim-ts-autotag").setup({})
  end,
}
