-- window split
vim.keymap.set("n", "<C-w>p", "<C-w>v")
vim.keymap.set("n", "<C-w>P", "<C-w>s")

-- window move
vim.keymap.set("n", "<C-w>h", "<C-w>h")
vim.keymap.set("n", "<C-w>j", "<C-w>j")
vim.keymap.set("n", "<C-w>k", "<C-w>k")
vim.keymap.set("n", "<C-w>l", "<C-w>l")

-- window resize
vim.keymap.set("n", "<C-w>H", "5<C-w><")
vim.keymap.set("n", "<C-w>J", "5<C-w>-")
vim.keymap.set("n", "<C-w>K", "5<C-w>+")
vim.keymap.set("n", "<C-w>L", "5<C-w>>")

-- linenumber
vim.keymap.set("n", "<C-n>", "<cmd>set relativenumber!<cr>")
