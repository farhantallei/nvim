return {
  "3rd/image.nvim",
  enabled = false,
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    backend = "sixel", -- untuk WezTerm
    processor = "magick_cli", -- paling mudah; pastikan ImageMagick terpasang
    integrations = {
      markdown = {
        enabled = true,
        download_remote_images = false, -- aman default; aktifkan jika perlu
        only_render_image_at_cursor = true,
        only_render_image_at_cursor_mode = "popup", -- performa lebih baik
        filetypes = { "markdown" },
      },
    },
    max_height_window_percentage = 50,
    window_overlap_clear_enabled = true,
  },
}
