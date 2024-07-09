-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  {
    "crnvl96/lazydocker.nvim",
    event = "VeryLazy",
    opts = {}, -- automatically calls `require("lazydocker").setup()`
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>k"] = {
                "<cmd>LazyDocker<CR>",
                desc = "Toggle LazyDocker",
                noremap = true,
                silent = true,
              },
            },
          },
        },
      },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["]h"] = {
                function()
                  local gs = require "gitsigns"
                  if vim.wo.diff then
                    vim.cmd.normal { "]c", bang = true }
                  else
                    gs.nav_hunk "next"
                  end
                end,
                desc = "Next Hunk",
                noremap = true,
                silent = true,
              },
              ["[h"] = {
                function()
                  local gs = require "gitsigns"
                  if vim.wo.diff then
                    vim.cmd.normal { "[c", bang = true }
                  else
                    gs.nav_hunk "prev"
                  end
                end,
                desc = "Prev Hunk",
                noremap = true,
                silent = true,
              },
              ["]H"] = {
                function()
                  local gs = require "gitsigns"
                  gs.nav_hunk "last"
                end,
                desc = "Last Hunk",
                noremap = true,
                silent = true,
              },
              ["[H"] = {
                function()
                  local gs = require "gitsigns"
                  gs.nav_hunk "first"
                end,
                desc = "First Hunk",
                noremap = true,
                silent = true,
              },
              ["<leader>ghS"] = {
                function()
                  local gs = require "gitsigns"
                  gs.stage_buffer()
                end,
                desc = "Stage Buffer",
                noremap = true,
                silent = true,
              },
              ["<leader>ghu"] = {
                function()
                  local gs = require "gitsigns"
                  gs.undo_stage_hunk()
                end,
                desc = "Undo Stage Hunk",
                noremap = true,
                silent = true,
              },
              ["<leader>ghR"] = {
                function()
                  local gs = require "gitsigns"
                  gs.reset_buffer()
                end,
                desc = "Reset Buffer",
                noremap = true,
                silent = true,
              },
              ["<leader>ghp"] = {
                function()
                  local gs = require "gitsigns"
                  gs.preview_hunk_inline()
                end,
                desc = "Preview Hunk Inline",
                noremap = true,
                silent = true,
              },
              ["<leader>ghb"] = {
                function()
                  local gs = require "gitsigns"
                  gs.blame_line { full = true }
                end,
                desc = "Blame Line",
                noremap = true,
                silent = true,
              },
              ["<leader>ghB"] = {
                function()
                  local gs = require "gitsigns"
                  gs.blame()
                end,
                desc = "Blame Buffer",
                noremap = true,
                silent = true,
              },
              ["<leader>ghd"] = {
                function()
                  local gs = require "gitsigns"
                  gs.diffthis()
                end,
                desc = "Diff This",
                noremap = true,
                silent = true,
              },
              ["<leader>ghD"] = {
                function()
                  local gs = require "gitsigns"
                  gs.diffthis "~"
                end,
                desc = "Diff This ~",
                noremap = true,
                silent = true,
              },
            },
            v = {
              ["<leader>ghs"] = {
                ":Gitsigns stage_hunk<CR>",
                desc = "Stage Hunk",
                noremap = true,
                silent = true,
              },
              ["<leader>ghr"] = {
                ":Gitsigns reset_hunk<CR>",
                desc = "Reset Hunk",
                noremap = true,
                silent = true,
              },
            },
            o = {
              ["ih"] = {
                ":<C-U>Gitsigns select_hunk<CR>",
                desc = "GitSigns Select Hunk",
                noremap = true,
                silent = true,
              },
            },
            x = {
              ["ih"] = {
                ":<C-U>Gitsigns select_hunk<CR>",
                desc = "GitSigns Select Hunk",
                noremap = true,
                silent = true,
              },
            },
          },
        },
      },
    },
    opts = {},
  },

  -- == Examples of Overriding Plugins ==

  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts) opts["window"] = {} end,
  },

  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts["routes"] = {
        {
          filter = {
            any = {
              { event = "msg_showmode" },
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
              { find = "written" },
            },
          },
          view = "mini",
        },
        {
          filter = {
            event = "Notify",
            find = "No information available",
          },
          opts = { skip = true },
        },
      }
    end,
  },
  -- {
  --   "folke/which-key.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     plugins = { spelling = true },
  --     defaults = {
  --       mode = { "n", "v" },
  --       ["<leader>w"] = { name = "+windows" },
  --     },
  --   },
  --   config = function(_, opts)
  --     local wk = require "which-key"
  --     wk.setup(opts)
  --     wk.register(opts.defaults)
  --   end,
  -- },
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "     ██╗ ██████╗ ██████╗  ██████╗ ███████╗████████╗",
        "     ██║██╔═══██╗██╔══██╗██╔════╝ ██╔════╝╚══██╔══╝",
        "     ██║██║   ██║██████╔╝██║  ███╗█████╗     ██║   ",
        "██   ██║██║   ██║██╔══██╗██║   ██║██╔══╝     ██║   ",
        "╚█████╔╝╚██████╔╝██████╔╝╚██████╔╝███████╗   ██║   ",
        " ╚════╝  ╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝   ╚═╝   ",
      }
      return opts
    end,
  },

  -- Customize Telescope
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<leader>fP"] = {
                function()
                  require("telescope.builtin").find_files {
                    cwd = require("lazy.core.config").options.root,
                  }
                end,
                desc = "Find Plugin File",
              },
              [";f"] = {
                function()
                  local builtin = require "telescope.builtin"
                  builtin.find_files {
                    no_ignore = false,
                    hidden = true,
                  }
                end,
                desc = "Find Files",
              },
              [";r"] = {
                function()
                  local builtin = require "telescope.builtin"
                  builtin.live_grep()
                end,
                desc = "Live Grep",
              },
              ["\\\\"] = {
                function()
                  local builtin = require "telescope.builtin"
                  builtin.buffers()
                end,
                desc = "Buffers",
              },
              [";t"] = {
                function()
                  local builtin = require "telescope.builtin"
                  builtin.help_tags()
                end,
                desc = "Help Tags",
              },
              [";;"] = {
                function()
                  local builtin = require "telescope.builtin"
                  builtin.resume()
                end,
                desc = "Resume",
              },
              [";e"] = {
                function()
                  local builtin = require "telescope.builtin"
                  builtin.diagnostics()
                end,
                desc = "Diagnostics",
              },
              [";s"] = {
                function()
                  local builtin = require "telescope.builtin"
                  builtin.treesitter()
                end,
                desc = "Treesitter",
              },
              [";o"] = {
                function()
                  local builtin = require "telescope.builtin"
                  builtin.oldfiles()
                end,
                desc = "Open Old Files",
              },
              ["sf"] = {
                function()
                  local telescope = require "telescope"
                  local function telescope_buffer_dir() return vim.fn.expand "%:p:h" end
                  -- this is a custom file browser that respects gitignored filespec

                  telescope.extensions.file_browser.file_browser {
                    path = "%:p:h",
                    cwd = telescope_buffer_dir(),
                    respesct_git = false,
                    hidden = true,
                    grouped = true,
                    previewer = true,
                    initial_mode = "normal",
                    layout_config = {
                      height = 40,
                    },
                  }
                end,
                desc = "File Browser",
              },
            },
          },
        },
      },
    },
    config = function(_, opts)
      local telescope = require "telescope"
      local actions = require "telescope.actions"
      local fb_actions = require("telescope").extensions.file_browser.actions

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        wrap_results = true,
        layourt_strategy = "horizontal",
        layourt_config = {
          prompt_position = "top",
        },
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
          layourt_config = {
            preview_cutoff = 9999,
          },
        },
      }

      opts.extensions = {
        file_browser = {
          theme = "dropdown",
          -- disables netrw and use telescope file browser in its place
          hijack_netrw = true,
          mappings = {
            ["n"] = {
              ["n"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["/"] = function() vim.cmd "startinsert" end,
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
      require("telescope").load_extension "fzf"
      require("telescope").load_extension "file_browser"
    end,
  },

  {
    "mini.indentscope",
    opts = {
      draw = {
        delay = 0,
        animation = function() return 0 end,
      },
    },
  },

  {
    "echasnovski/mini.files",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["sm"] = {
                function()
                  if not require("mini.files").close() then require("mini.files").open() end
                end,
                desc = "Open mini.files (Directory of Current File)",
              },
            },
          },
        },
      },
    },
    opts = {},
  },

  -- You can disable default plugins as follows:
  -- { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom luasnip configuration such as filetype extend or custom snippets
  --     local luasnip = require "luasnip"
  --     luasnip.filetype_extend("javascript", { "javascriptreact" })
  --   end,
  -- },

  -- {
  --   "windwp/nvim-autopairs",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require "nvim-autopairs"
  --     local Rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --     npairs.add_rules(
  --       {
  --         Rule("$", "$", { "tex", "latex" })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex "%%")
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex("xxx", 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex "xx")
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule("a", "a", "-vim")
  --     )
  --   end,
  -- },
}
