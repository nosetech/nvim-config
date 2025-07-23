return {
	{
		"lambdalisue/fern.vim",
		config = function()
			vim.keymap.set("n", "<C-e>", "<cmd>Fern . -reveal=% -drawer -toggle<cr>")
		end,
	},
	{
		"lambdalisue/fern-git-status.vim",
	},
}
