return {
  "stevearc/conform.nvim",
  -- enabled = false,
  opts = function(_, opts)
    opts.formatters = vim.tbl_deep_extend("force", opts.formatters or {}, {
      biome = {
        command = "biome",
        args = { "format", "--stdin-file-path", "$FILENAME" },
        stdin = true,
        prefer_local = "node_modules/.bin",
      },
      prettierd = {
        command = "prettierd",
        args = { "--stdin-filepath", "$FILENAME" },
        stdin = true,
      },
      stylua = {
        command = "stylua",
        args = { "-" },
        stdin = true,
      },
      gofumpt = {
        command = "gofumpt",
        stdin = true,
      },
      goimports = {
        command = "goimports",
        stdin = true,
      },
    })

    opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft or {}, {
      javascript = { "biome" },
      typescript = { "biome" },
      javascriptreact = { "biome" },
      typescriptreact = { "biome" },
      json = { "biome" },
      html = { "biome" },
      css = { "biome" },
      scss = { "biome" },
      markdown = { "biome" },
      lua = { "stylua" },
      go = { "gofumpt", "goimports" },
      sh = { "shfmt" },
    })

    -- local conform = require("conform")
    -- local original_format = require("conform").format
    --
    -- conform.format = function(args)
    --   local ft = vim.bo.filetype
    --   if ft == "javascript" or ft == "typescript" or ft == "javascriptreact" or ft == "typescriptreact" then
    --     local file = vim.api.nvim_buf_get_name(0)
    --     if file ~= "" then
    --       local cwd = vim.fn.getcwd()
    --       local local_biome = cwd .. "/node_modules/.bin/biome"
    --       local biome_cmd
    --       if vim.fn.filereadable(local_biome) == 1 then
    --         biome_cmd = local_biome
    --       elseif vim.fn.executable("biome") == 1 then
    --         biome_cmd = "biome"
    --       end
    --       if biome_cmd then
    --         vim.fn.system({ biome_cmd, "check", "--apply", file })
    --       end
    --     end
    --   end
    --   return original_format(args)
    -- end
  end,
}
