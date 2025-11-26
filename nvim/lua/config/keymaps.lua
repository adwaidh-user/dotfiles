vim.g.mapleader = ' '

local map = vim.keymap.set

map({'i', 'v'}, '<leader>jk', '<Esc>')
map({'n', 'v'}, '<leader>q', '<cmd>q<cr>')
map({'n', 'v'}, '<leader>w', '<cmd>w<cr>')
-- Copy lines Up and Down
map({'n', 'x'}, '<M-j>', '<cmd>m.-1<cr>')
map({'n', 'x'}, '<M-k>', '<cmd>m.1<cr>')
-- Move lines Up and Down
map({'n', 'x'}, '<M-J>', '<cmd>co.-1<cr>')
map({'n', 'x'}, '<M-K>', '<cmd>co.0<cr>')
