return {
  "kristijanhusak/vim-dadbod-completion",
  enabled = false,
  dependencies = "vim-dadbod",
  ft = sql_ft,
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = sql_ft,
      callback = function()
        local cmp = require("cmp")

        -- global sources
        ---@param source cmp.SourceConfig
        local sources = vim.tbl_map(function(source)
          return { name = source.name }
        end, cmp.get_config().sources)

        -- add vim-dadbod-completion source
        table.insert(sources, { name = "vim-dadbod-completion" })

        -- update sources for the current buffer
        cmp.setup.buffer({ sources = sources })
      end,
    })
  end,
}
