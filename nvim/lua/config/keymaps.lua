vim.g.mapleader = " "

local map = vim.keymap.set

map({ "i", "v" }, "<leader>jk", "<Esc>", { desc = "Enter NORMAL mode" })
map({ "n", "v" }, "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map({ "n", "v" }, "<leader>Q", "<cmd>q!<cr>", { desc = "Force Quit" })
map({ "n", "v" }, "<leader>w", "<cmd>w<cr>", { desc = "Write to buffer" })
-- Copy lines Up and Down
map({ "n", "x" }, "<C-M-k>", "<cmd>m.1<cr>", { desc = "Move lines up" })
map({ "n", "x" }, "<C-M-j>", "<cmd>m.-1<cr>", { desc = "Move lines down" })
-- Move lines Up and Down
map({ "n", "x" }, "<C-M-w>", "<cmd>co.-1<cr>", { desc = "Copy lines up" })
map({ "n", "x" }, "<C-M-s>", "<cmd>co.0<cr>", { desc = "Copy lines down" })
-- Buffers
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Jump to next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Jump to previous buffer" })
-- Tabs
map("n", "<leader>tN", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader>tn", "<cmd>tabNext<cr>", { desc = "Jump to next tab" })
map("n", "<leader>tp", "<cmd>tabprevios<cr>", { desc = "Jump to previous tab" })
