return {
  "b0o/incline.nvim",
  dependencies = { "loctvl842/monokai-pro.nvim" },
  event = "VeryLazy",
  config = function()
    local colorscheme = require("monokai-pro.colorscheme")
    local colors = colorscheme.get("pro")

    require("incline").setup({
      highlight = {
        groups = {
          InclineNormal = {
            guibg = colors.tab.activeBackground,
            guifg = colors.tab.activeForeground,
          },
          InclineNormalNC = {
            guibg = colors.tab.inactiveBackground,
            guifg = colors.tab.inactiveForeground,
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
}
