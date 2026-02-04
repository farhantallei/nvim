-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- vim.api.nvim_create_autocmd("VimEnter", {
--   callback = function()
--     -- Auto-open MiniMap
--     require("mini.map").open()
--   end,
-- })

vim.api.nvim_create_user_command("RunMacroAsync", function(opts)
  local reg = opts.args:match("^(%S+)")
  local times, delay = opts.args:match("^%S+%s+(%d+)%s+(%d+)$")
  times = tonumber(times) or 1
  delay = tonumber(delay) or 100

  local i = 0
  local timer = vim.loop.new_timer()

  if timer == nil then
    return
  end
  timer:start(0, delay, function()
    if i >= times then
      timer:stop()
      timer:close()
      return
    end

    i = i + 1
    vim.schedule(function()
      vim.cmd("normal! @" .. reg)
    end)
  end)
end, { nargs = "+" })
