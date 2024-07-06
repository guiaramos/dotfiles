return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "go",
        "gomod",
        "gowork",
        "gosum",
        "terraform",
        "hcl",
        "ninja",
        "rst",
        "json5",
        "dockerfile",
        "bash",
        "c",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
        "git_config",
        "gitcommit",
        "git_rebase",
        "gitignore",
        "gitattributes",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        move = {
          enable = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
        },
      },
      opts = function(_, opts)
        local function add(lang)
          if type(opts.ensure_installed) == "table" then
            table.insert(opts.ensure_installed, lang)
          end
        end

        vim.filetype.add {
          extension = { rasi = "rasi", rofi = "rasi", wofi = "rasi" },
          filename = {
            ["vifmrc"] = "vim",
          },
          pattern = {
            [".*/waybar/config"] = "jsonc",
            [".*/mako/config"] = "dosini",
            [".*/kitty/.+%.conf"] = "bash",
            [".*/hypr/.+%.conf"] = "hyprlang",
            ["%.env%.[%w_.-]+"] = "sh",
          },
        }

        add "git_config"

        if have "hypr" then
          add "hyprlang"
        end

        if have "fish" then
          add "fish"
        end

        if have "rofi" or have "wofi" then
          add "rasi"
        end
      end,
    },
  },
}
