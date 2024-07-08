require "configs.keymaps"

local map = vim.keymap.set

-- discipline
local discipline = require "guiaramos.discipline"

discipline.cowboy()

-- General
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")
map("i", "jk", "<ESC>")

-- rename
map("n", "<leader>cr", function()
  local inc_rename = require "inc_rename"
  return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand "<cword>"
end, { desc = "Rename (inc-rename.nvim)", expr = true })

-- Increment/decrement numbers
map("n", "+", function()
  require("dial.map").manipulate("increment", "normal")
end)
map("n", "-", function()
  require("dial.map").manipulate("decrement", "normal")
end)
map("n", "g<C-a>", function()
  require("dial.map").manipulate("increment", "gnormal")
end)
map("n", "g<C-x>", function()
  require("dial.map").manipulate("decrement", "gnormal")
end)
map("v", "<C-a>", function()
  require("dial.map").manipulate("increment", "visual")
end)
map("v", "<C-x>", function()
  require("dial.map").manipulate("decrement", "visual")
end)
map("v", "g<C-a>", function()
  require("dial.map").manipulate("increment", "gvisual")
end)
map("v", "g<C-x>", function()
  require("dial.map").manipulate("decrement", "gvisual")
end)

-- Select all
map("n", "<C-a>", "gg<S-v>G", { desc = "VIEW Select all" })

-- Jumplist
map("n", "<C-m>", "<C-i>", { desc = "JUMPLIST", noremap = true, silent = true })

-- New tab
map("n", "te", ":tabedit ", { desc = "TABS New tab", noremap = true, silent = true })
map("n", "<tab>", ":tabnext<Return>", { desc = "TABS Next tab", noremap = true, silent = true })
map("n", "<s-tab>", ":tabprevious<Return>", { desc = "TABS Previous tab", noremap = true, silent = true })

-- Split window
map("n", "ss", ":split<Return>", { desc = "WINDOW Split Window Below", noremap = true, silent = true })
map("n", "sv", ":vsplit<Return>", { desc = "WINDOW Window Right", noremap = true, silent = true })

-- Mov between windows
map("n", "sh", "<C-w>h", { desc = "WINDOW Move To The Window On The Left" })
map("n", "sj", "<C-w>j", { desc = "WINDOW Move To The Window Below" })
map("n", "sk", "<C-w>k", { desc = "WINDOW Move To The Window Above" })
map("n", "sl", "<C-w>l", { desc = "WINDOW Move To The Window On The Right" })

-- Mov TMUX
map("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", { desc = "TMUX Go to the previous pane", remap = true })
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "TMUX Got to the left pane", remap = true })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "TMUX Got to the down pane", remap = true })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "TMUX Got to the up pane", remap = true })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "TMUX Got to the right pane", remap = true })

-- Resize windows
map("n", "<C-w><left>", "<C-w><", { desc = "WINDOW Decrease Window Width" })
map("n", "<C-w><right>", "<C-w>>", { desc = "WINDOW Increase Window Width" })
map("n", "<C-w><up>", "<C-w>+", { desc = "WINDOW Increase Window Height" })
map("n", "<C-w><down>", "<C-w>-", { desc = "WINDOW Decrease Window Height" })

-- Buffer management
map("n", "bd", ":bd<Return>", { desc = "BUFFER Close Buffer", noremap = true, silent = true })

-- Golang
map("n", "<leader>gsj", "<cmd> GoTagAdd json <CR>", { desc = "GOLANG Add JSON Struct Tags" })

-- AI
map("n", "c-s", "<CR>", { desc = "AI Submit Prompt", remap = true })

map({ "n", "v" }, "<leader>aa", function()
  return require("CopilotChat").toggle()
end, { desc = "AI Toggle (CopilotChat)" })

map({ "n", "v" }, "<leader>ax", function()
  return require("CopilotChat").reset()
end, { desc = "AI Clear (CopilotChat)" })

map({ "n", "v" }, "<leader>aq", function()
  local input = vim.fn.input "Quick Chat: "
  if input ~= "" then
    require("CopilotChat").ask(input)
  end
end, { desc = "AI Quick Chat (CopilotChat)" })

-- Toggle Auto Format
map("n", "<leader>uf", "<cmd>FormatToggle<CR>", { desc = "Toggle Auto Format (Global)" })

--- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })
