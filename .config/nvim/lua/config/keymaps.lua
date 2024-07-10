-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment/decrement numbers
keymap.set("n", "+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "-", "<C-x>", { desc = "Decrement number" })

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
-- keymap.set("n", "te", ":tabedit<Return>", opts)
-- keymap.set("n", "<tab>", ":tabnext<Return>", opts)
-- keymap.set("n", "<s-tab>", ":tabprevious<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", { desc = "Split window below", noremap = true, silent = true })
keymap.set("n", "sv", ":vsplit<Return>", { desc = "Vsplit window right", noremap = true, silent = true })

-- Mov between windows
keymap.set("n", "sh", "<C-w>h", { desc = "Move to the window on the left" })
keymap.set("n", "sj", "<C-w>j", { desc = "Move to the window below" })
keymap.set("n", "sk", "<C-w>k", { desc = "Move to the window above" })
keymap.set("n", "sl", "<C-w>l", { desc = "Move to the window on the right" })

-- Resize windows
keymap.set("n", "<C-w><left>", "<C-w><", { desc = "Decrease window width" })
keymap.set("n", "<C-w><right>", "<C-w>>", { desc = "Increase window width" })
keymap.set("n", "<C-w><up>", "<C-w>+", { desc = "Increase window height" })
keymap.set("n", "<C-w><down>", "<C-w>-", { desc = "Decrease window height" })

-- Buffer management
keymap.set("n", "bd", ":bd<Return>", { desc = "Close buffer", noremap = true, silent = true })
