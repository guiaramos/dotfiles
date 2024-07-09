-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        mouse = "",
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- General
        ["<C-a>"] = {
          "gg<S-v>G",
          desc = "Select all",
        },

        -- Increment/Decrement numbers
        ["+"] = {
          "<C-a>",
          desc = "Increment number under cursor",
        },
        ["-"] = {
          "<C-x>",
          desc = "Decrement number under cursor",
        },

        -- Tab management
        ["te"] = {
          ":tabedit<CR>",
          desc = "New tab",
        },
        ["<Tab>"] = {
          ":tabnext<Return>",
          desc = "Next tab",
        },
        ["<S-Tab>"] = {
          ":tabprevious<Return>",
          desc = "Previous tab",
        },

        -- Window management
        ["ss"] = {
          ":split<Return>",
          desc = "Split window below",
        },
        ["sv"] = {
          ":vsplit<Return>",
          desc = "Vsplit window right",
        },

        -- Mov between windows
        ["sh"] = {
          "<C-w>h",
          desc = "Move to the window on the left",
        },
        ["sj"] = {
          "<C-w>j",
          desc = "Move to the window below",
        },
        ["sk"] = {
          "<C-w>k",
          desc = "Move to the window above",
        },
        ["sl"] = {
          "<C-w>l",
          desc = "Move to the window on the right",
        },

        -- Resize windows
        ["<C-w><left>"] = {
          "<C-w><",
          desc = "Decrease window width",
        },
        ["<C-w><right>"] = {
          "<C-w>>",
          desc = "Increase window width",
        },
        ["<C-w><up>"] = {
          "<C-w>+",
          desc = "Increase window height",
        },
        ["<C-w><down>"] = {
          "<C-w>-",
          desc = "Decrease window height",
        },

        -- Buffer management
        ["bd"] = {
          ":bd<Return>",
          desc = "Close buffer",
        },

        -- Window management
        ["<leader>ww"] = {
          "<C-W>p",
          desc = "Other Window",
          remap = true,
          noremap = true,
          silent = true,
        },
        ["<leader>wd"] = {
          "<C-W>c",
          desc = "Delete Window",
          remap = true,
          noremap = true,
          silent = true,
        },
        ["<leader>w-"] = {
          "<C-W>s",
          desc = "Split Window Below",
          remap = true,
          noremap = true,
          silent = true,
        },
        ["<leader>w|"] = {
          "<C-W>v",
          desc = "Split Window Right",
          remap = true,
          noremap = true,
          silent = true,
        },
        ["<leader>-"] = {
          "<C-W>s",
          desc = "Split Window Below",
          remap = true,
          noremap = true,
          silent = true,
        },
        ["<leader>|"] = {
          "<C-W>v",
          desc = "Split Window Right",
          remap = true,
          noremap = true,
          silent = true,
        },
      },
    },
  },
}
