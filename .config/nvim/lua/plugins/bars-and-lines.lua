return {
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Previous tab" },
    },
    opts = {
      options = {
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
  {
    "b0o/incline.nvim",
    dependencies = { "catppuccin/nvim" },
    event = "VeryLazy",
    config = function()
      local C = require("catppuccin.palettes").get_palette("mocha")
      local O = require("catppuccin").options
      local transparent_background = O.transparent_background
      local active_bg = transparent_background and "NONE" or C.base
      local inactive_bg = transparent_background and "NONE" or C.mantle
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = {
              guibg = active_bg,
              guifg = C.text,
            },
            InclineNormalNC = {
              guibg = inactive_bg,
              guifg = C.surface1,
            },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = { cursorline = true },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end
          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },
}
