-- ============================================================================
-- basic operation
-- ============================================================================
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

-- ============================================================================
-- plugin operation
-- ============================================================================
-- bufferline
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>")
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>")
vim.keymap.set("n", "<C-t>l", "<cmd>BufferLineMoveNext<cr>")
vim.keymap.set("n", "<C-t>h", "<cmd>BufferLineMovePrev<cr>")
vim.keymap.set("n", "<C-t>wl", "<cmd>BufferLineCloseRight<cr>")
vim.keymap.set("n", "<C-t>wh", "<cmd>BufferLineCloseLeft<cr>")
vim.keymap.set("n", "<C-t>ww", "<cmd>BufferLinePickClose<cr>")

-- Fern
vim.keymap.set("n", "<C-e>", "<cmd>Fern . -reveal=% -drawer -toggle<cr>")

-- gitgutter
vim.keymap.set("n", "g[", "<cmd>GitGutterPrevHunk<cr>")
vim.keymap.set("n", "g]", "<cmd>GitGutterNextHunk<cr>")
vim.keymap.set("n", "gh", "<cmd>GitGutterLineHighlightsToggle<cr>")
vim.keymap.set("n", "gp", "<cmd>GitGutterPreviewHunk<cr>")

-- todo-comments
vim.keymap.set("n", "t]", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "t[", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

vim.keymap.set("n", "tn", "<cmd>TodoTelescope<cr>")

-- edge motion
vim.keymap.set("n", "<C-j>", "<Plug>(edgemotion-j)")
vim.keymap.set("n", "<C-k>", "<Plug>(edgemotion-k)")

-- dial
vim.keymap.set("n", "<C-a>", function()
	require("dial.map").manipulate("increment", "normal")
end)
vim.keymap.set("n", "<C-x>", function()
	require("dial.map").manipulate("decrement", "normal")
end)
vim.keymap.set("n", "g<C-a>", function()
	require("dial.map").manipulate("increment", "gnormal")
end)
vim.keymap.set("n", "g<C-x>", function()
	require("dial.map").manipulate("decrement", "gnormal")
end)
vim.keymap.set("v", "<C-a>", function()
	require("dial.map").manipulate("increment", "visual")
end)
vim.keymap.set("v", "<C-x>", function()
	require("dial.map").manipulate("decrement", "visual")
end)
vim.keymap.set("v", "g<C-a>", function()
	require("dial.map").manipulate("increment", "gvisual")
end)
vim.keymap.set("v", "g<C-x>", function()
	require("dial.map").manipulate("decrement", "gvisual")
end)
