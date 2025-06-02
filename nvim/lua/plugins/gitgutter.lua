return {
	{
		"airblade/vim-gitgutter",
		config = function()
			vim.cmd("highlight GitGutterAdd guifg=green ctermfg=green")
			vim.cmd("highlight GitGutterChange guifg=blue ctermfg=blue")
			vim.cmd("highlight GitGutterDelete guifg=red ctermfg=red")
		end,
	},
}
