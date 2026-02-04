return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
  -- keys = {
  --   { "<leader>ng", "<cmd>Neogit<cr>", desc = "Neogit" },
  -- },
  opts = {
    disable_commit_confirmation = true,
    integrations = {
      diffview = true,
    },
  },
}
