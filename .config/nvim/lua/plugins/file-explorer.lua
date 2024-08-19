return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      window = {
        mappings = {
          ["Y"] = {
            function(state)
              -- NeoTree is based on [NuiTree](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree)
              -- The node is based on [NuiNode](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree#nuitreenode)
              local node = state.tree:get_node()
              local filepath = node:get_id()
              local filename = node.name
              local modify = vim.fn.fnamemodify

              local results = {
                filepath,
                modify(filepath, ":."),
                modify(filepath, ":~"),
                filename,
                modify(filename, ":r"),
                modify(filename, ":e"),
              }

              vim.ui.select({
                "1. Absolute path: " .. results[1],
                "2. Path relative to CWD: " .. results[2],
                "3. Path relative to HOME: " .. results[3],
                "4. Filename: " .. results[4],
                "5. Filename without extension: " .. results[5],
                "6. Extension of the filename: " .. results[6],
              }, { prompt = "Choose to copy to clipboard:" }, function(choice)
                if choice then
                  local i = tonumber(choice:sub(1, 1))
                  if i then
                    local result = results[i]
                    vim.fn.setreg("+", result, "c")
                    vim.notify("Copied: " .. result)
                  else
                    vim.notify("Invalid selection")
                  end
                else
                  vim.notify("Selection cancelled")
                end
              end)
            end,
            desc = "Copy Path to Clipboard",
          },
        },
      },
    },
  },
  {
    "mini.files",
    keys = {
      {
        "sm",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        desc = "Open mini.files (Directory of Current File)",
      },
    },
  },
  {
    "telescope.nvim",
    dependencies = {
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      {
        "<leader>fP",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
      {
        ";f",
        function()
          local builtin = require("telescope.builtin")
          builtin.find_files({
            no_ignore = false,
            hidden = true,
          })
        end,
        desc = "Find Files",
      },
      {
        ";g",
        function()
          local builtin = require("telescope.builtin")
          builtin.live_grep()
        end,
        desc = "Live Grep",
      },
      {
        "\\\\",
        function()
          local builtin = require("telescope.builtin")
          builtin.buffers()
        end,
        desc = "Buffers",
      },
      {
        ";t",
        function()
          local builtin = require("telescope.builtin")
          builtin.help_tags()
        end,
        desc = "Help Tags",
      },
      {
        ";;",
        function()
          local builtin = require("telescope.builtin")
          builtin.resume()
        end,
        desc = "Resume",
      },
      {
        ";e",
        function()
          local builtin = require("telescope.builtin")
          builtin.diagnostics()
        end,
        desc = "Diagnostics",
      },
      {
        ";s",
        function()
          local builtin = require("telescope.builtin")
          builtin.treesitter()
        end,
        desc = "Treesitter",
      },
      {
        ";o",
        function()
          local builtin = require("telescope.builtin")
          builtin.oldfiles()
        end,
        desc = "Open Old Files",
      },
      {
        "sf",
        function()
          local telescope = require("telescope")
          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end

          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respesct_git = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = {
              height = 40,
            },
          })
        end,
        desc = "File Browser",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions

      -- local colors = require("catppuccin.palettes").get_palette("mocha")
      -- local TelescopeColor = {
      --   TelescopeMatching = { fg = colors.flamingo },
      --   TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true },
      --
      --   TelescopePromptPrefix = { bg = colors.surface0 },
      --   TelescopePromptNormal = { bg = colors.surface0 },
      --   TelescopeResultsNormal = { bg = colors.mantle },
      --   TelescopePreviewNormal = { bg = colors.mantle },
      --   TelescopePromptBorder = { bg = colors.surface0, fg = colors.surface0 },
      --   TelescopeResultsBorder = { bg = colors.mantle, fg = colors.mantle },
      --   TelescopePreviewBorder = { bg = colors.mantle, fg = colors.mantle },
      --   TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle },
      --   TelescopeResultsTitle = { fg = colors.mantle },
      --   TelescopePreviewTitle = { bg = colors.green, fg = colors.mantle },
      -- }
      --
      -- for hl, col in pairs(TelescopeColor) do
      --   vim.api.nvim_set_hl(0, hl, col)
      -- end

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        wrap_results = true,
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          n = {},
        },
      })
      opts.pickers = {
        diagnostics = {
          theme = "ivy",
          initial_mode = "normal",
          layout_config = {
            preview_cutoff = 9999,
          },
        },
      }
      opts.extensions = {
        file_browser = {
          theme = "dropdown",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            ["n"] = {
              ["N"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["/"] = function()
                vim.cmd("startinsert")
              end,
              ["<C-u>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_previous(prompt_bufnr)
                end
              end,
              ["<C-d>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_next(prompt_bufnr)
                end
              end,
              ["<PageUp>"] = actions.preview_scrolling_up,
              ["<PageDown>"] = actions.preview_scrolling_down,
            },
          },
        },
      }
      telescope.setup(opts)
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("file_browser")
    end,
  },
}
