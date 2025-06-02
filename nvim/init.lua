vim.loader.enable()

require("keymap")
require("plugin_manager")
require("config")

vim.opt.number = true
vim.cmd("highlight LineNr guifg=#999999")
vim.opt.numberwidth = 1
vim.opt.hlsearch = true
vim.opt.termguicolors = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.clipboard = "unnamedplus"

-- clipboard config for wsl
-- yankしたときにクリップボードに保存する
if vim.fn.has("wsl") == 1 then
	vim.api.nvim_create_autocmd("TextYankPost", {
		group = vim.api.nvim_create_augroup("Yank", { clear = true }),
		callback = function()
			vim.fn.system("clip.exe", vim.fn.getreg('"'))
		end,
	})
end
