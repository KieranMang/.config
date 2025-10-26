vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader>f", "<cmd>Neoformat<CR>")

vim.keymap.set("n", "<leader>;", "maA;<esc>`a<cmd>delmarks a<CR>")

vim.keymap.set("n", "<leader>k", "maO<esc>`a<cmd>delmarks a<CR>")
vim.keymap.set("n", "<leader>j", "mao<esc>`a<cmd>delmarks a<CR>")
-- vim.keymap.set("i", "(", "()<esc>i")
-- vim.keymap.set("i", "'", "''<esc>i")
-- vim.keymap.set("i", "\"", "\"\"<esc>i")

vim.keymap.set("n", "<leader>ff", "<cmd>Files<CR>")
vim.keymap.set("n", "<leader>gf", "<cmd>GFiles<CR>")
vim.keymap.set("n", "<leader>sf", "<cmd>GFiles?<CR>")

vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")

vim.keymap.set('n', 'q:', '<Nop>', { noremap = true, silent = true })
