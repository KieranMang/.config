-- See lazy.lua for leaders

--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pv", "<cmd>Oil<CR>")
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>;", "maA;<esc>`a<cmd>delmarks a<CR>")

vim.keymap.set("n", "<leader>k", "maO<esc>`a<cmd>delmarks a<CR>")
vim.keymap.set("n", "<leader>j", "mao<esc>`a<cmd>delmarks a<CR>")

vim.keymap.set("n", "<leader>fm", "magg=G`a<cmd>delmarks a<CR>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
vim.keymap.set("n", "L", "<cmd>Lazy<CR>")
