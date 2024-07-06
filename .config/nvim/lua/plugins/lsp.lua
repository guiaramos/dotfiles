return {
  { "petertriho/cmp-git", opts = {} },
  {
    "neovim/nvim-lspconfig",
    opts = function()
      return {
        -- options for vim.diagnostic.config()
        ---@type vim.diagnostic.Opts
        diagnostics = {
          underline = true,
          update_in_insert = false,
          severity_sort = true,
        },
        inlay_hints = {
          enabled = true,
          exclude = { "vue" },
        },
        codelens = {
          enabled = false,
        },
        document_highlight = {
          enabled = true,
        },
        capabilities = {
          workspace = {
            fileOperations = {
              didRename = true,
              willRename = true,
            },
          },
        },
        format = {
          formatting_options = nil,
          timeout_ms = nil,
        },
      }
    end,
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "delve",
        "gomodifytags",
        "impl",
        "goimports-reviser",
        "gofumpt",
        "golines",
        "shellcheck",
        "tflint",
        "markdownlint-cli2",
        "markdown-toc",
        "lua-language-server",
        "gopls",
        "hadolint",
        "pyright",
        "mypy",
        "ruff",
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = function(_, opts)
      return require "configs.null-ls"
    end,
  },
  {
    {
      "nvim-neotest/neotest",
      dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "fredrikaverpil/neotest-golang",
        "nvim-neotest/neotest-python",
      },
      config = function()
        require("neotest").setup {
          adapters = {
            require "neotest-golang",
            require "neotest-python",
          },
        }
      end,
      opts = {
        adapters = {
          ["neotest-python"] = {
            runner = "unittest",
            python = ".venv/bin/python",
          },
        },
      },
      -- stylua: ignore
      keys = {
        {"<leader>t", "", desc = "+test"},
        { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
        { "<leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "Run All Test Files" },
        { "<leader>tr", function() require("neotest").run.run() end, desc = "Run Nearest" },
        { "<leader>tl", function() require("neotest").run.run_last() end, desc = "Run Last" },
        { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
        { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
        { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
        { "<leader>tS", function() require("neotest").run.stop() end, desc = "Stop" },
        { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Toggle Watch" },
      },
    },
  },
  -- json
  {
    "b0o/SchemaStore.nvim",
    lazy = true,
    version = false, -- last release is way too old
  },
  -- markdown
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      {
        "<leader>cp",
        ft = "markdown",
        "<cmd>MarkdownPreviewToggle<cr>",
        desc = "Markdown Preview",
      },
    },
    config = function()
      vim.cmd [[do FileType]]
    end,
  },
  {
    "lukas-reineke/headlines.nvim",
    opts = function()
      local opts = {}
      for _, ft in ipairs { "markdown", "norg", "rmd", "org" } do
        opts[ft] = {
          headline_highlights = {},
          -- disable bullets for now. See https://github.com/lukas-reineke/headlines.nvim/issues/66
          bullets = {},
        }
        for i = 1, 6 do
          local hl = "Headline" .. i
          vim.api.nvim_set_hl(0, hl, { link = "Headline", default = true })
          table.insert(opts[ft].headline_highlights, hl)
        end
      end
      return opts
    end,
    ft = { "markdown", "norg", "rmd", "org" },
    config = function(_, opts)
      -- PERF: schedule to prevent headlines slowing down opening a file
      vim.schedule(function()
        require("headlines").setup(opts)
        require("headlines").refresh()
      end)
    end,
  },
  -- terraform
  {
    "ANGkeith/telescope-terraform-doc.nvim",
    config = function()
      require("telescope").load_extension "terraform_doc"
    end,
  },
  {
    "cappyzawa/telescope-terraform.nvim",
    config = function()
      require("telescope").load_extension "terraform"
    end,
  },
}
