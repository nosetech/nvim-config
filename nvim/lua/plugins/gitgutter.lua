return {
	{
		"airblade/vim-gitgutter",
		config = function()
			vim.cmd("highlight GitGutterAdd guifg=green ctermfg=green")
			vim.cmd("highlight GitGutterChange guifg=blue ctermfg=blue")
			vim.cmd("highlight GitGutterDelete guifg=red ctermfg=red")

			vim.keymap.set("n", "g[", "<cmd>GitGutterPrevHunk<cr>")
			vim.keymap.set("n", "g]", "<cmd>GitGutterNextHunk<cr>")
			vim.keymap.set("n", "gh", "<cmd>GitGutterLineHighlightsToggle<cr>")
			vim.keymap.set("n", "gp", "<cmd>GitGutterPreviewHunk<cr>")
		end,
	},
}
