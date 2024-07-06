require "nvchad.options"

local opt = vim.opt

opt.autowrite = true -- Enable auto write
-- only set clipboard if not in ssh, to make sure the OSC 52
-- integration works automatically. Requires Neovim >= 0.10.0
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.foldlevel = 99
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.jumpoptions = "view"
opt.laststatus = 3 -- global statusline
opt.linebreak = true -- Wrap lines at convenient points
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append { W = true, I = true, c = true, C = true }
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.spelloptions:append "noplainbuffer"
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap

if vim.fn.has "nvim-0.10" == 1 then
  opt.smoothscroll = true
  opt.foldmethod = "expr"
  opt.foldtext = ""
else
  opt.foldmethod = "indent"
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
-- set relative numbers
vim.wo.relativenumber = true

-- Enable undercurl
vim.cmd [[let &t_Cs = "\e[4:3m"]]
vim.cmd [[let &t_Ce = "\e[0m"]]

-- notify
local C = require("catppuccin.palettes").get_palette "mocha"
local O = require("catppuccin").options
-- stylua: ignore
vim.api.nvim_set_hl(0, "NotifyBackground" , { bg = (O.transparent_background and vim.o.winblend == 0) and "#000000" or C.mantle })
vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = C.red })
vim.api.nvim_set_hl(0, "NotifyERRORIcon", { fg = C.red })
vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = C.red })
vim.api.nvim_set_hl(0, "NotifyWARNBorder", { fg = C.yellow })
vim.api.nvim_set_hl(0, "NotifyWARNIcon", { fg = C.yellow })
vim.api.nvim_set_hl(0, "NotifyWARNTitle", { fg = C.yellow })
vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = C.blue })
vim.api.nvim_set_hl(0, "NotifyINFOIcon", { fg = C.blue })
vim.api.nvim_set_hl(0, "NotifyINFOTitle", { fg = C.blue })
vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = C.peach })
vim.api.nvim_set_hl(0, "NotifyDEBUGIcon", { fg = C.peach })
vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { fg = C.peach })
vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { fg = C.rosewater })
vim.api.nvim_set_hl(0, "NotifyTRACEIcon", { fg = C.rosewater })
vim.api.nvim_set_hl(0, "NotifyTRACETitle", { fg = C.rosewater })
vim.notify = require "notify"

-- neotest
vim.api.nvim_set_hl(0, "NeotestPassed", { fg = C.green })
vim.api.nvim_set_hl(0, "NeotestFailed", { fg = C.red })
vim.api.nvim_set_hl(0, "NeotestRunning", { fg = C.yellow })
vim.api.nvim_set_hl(0, "NeotestSkipped", { fg = C.blue })
vim.api.nvim_set_hl(0, "NeotestTest", { fg = C.text })
vim.api.nvim_set_hl(0, "NeotestNamespace", { fg = C.mauve })
vim.api.nvim_set_hl(0, "NeotestFocused", {})
vim.api.nvim_set_hl(0, "NeotestFile", { fg = C.blue })
vim.api.nvim_set_hl(0, "NeotestDir", { fg = C.blue })
vim.api.nvim_set_hl(0, "NeotestIndent", { fg = C.overlay1 })
vim.api.nvim_set_hl(0, "NeotestExpandMarker", { fg = C.overlay1 })
vim.api.nvim_set_hl(0, "NeotestAdapterName", { fg = C.maroon })
vim.api.nvim_set_hl(0, "NeotestWinSelect", { fg = C.blue })
vim.api.nvim_set_hl(0, "NeotestMarked", { fg = C.peach })
vim.api.nvim_set_hl(0, "NeotestTarget", { fg = C.red })
vim.api.nvim_set_hl(0, "NeotestUnknown", { fg = C.text })

-- disable mouse
opt.mouse = ""
