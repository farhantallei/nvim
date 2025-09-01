return {
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("diffview").setup({
        enhanced_diff_hl = true,
        view = {
          merge_tool = {
            layout = "diff3_mixed",
          },
        },
      })

      vim.keymap.set("n", "<leader>dv", ":DiffviewOpen<CR>", { desc = "Open Git Diff View" })
      vim.keymap.set("n", "<leader>gq", ":DiffviewClose<CR>", { desc = "Git Diff Close" })
    end,
  },
}
