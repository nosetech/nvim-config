return {
	{
		"SirVer/ultisnips",
		config = function()
			vim.g.UltiSnipsExpandTrigger = "<tab>"
			vim.g.UltiSnipsJumpForwardTrigger = "<c-n>"
			vim.g.UltiSnipsJumpBackwardTrigger = "<c-p>"
			vim.g.UltiSnipsEditSplit = "vertical"
		end,
	},
}
