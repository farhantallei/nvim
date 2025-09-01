return {
  "andymass/vim-matchup",
  opts = {
    treesitter = {
      stopline = 500,
    },
  },
  config = function()
    vim.g.matchup_treesitter_stopline = 500

    require("match-up").setup({
      treesitter = {
        stopline = 500,
      },
    })
  end,
}
