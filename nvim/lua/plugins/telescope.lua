return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		-- or                            , branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			-- ファイル検索
			{
				"<C-p>",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Telescope: ファイルを検索",
			},
			-- ライブ検索
			{
				"rg",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Telescope: ライブ検索",
			},
			-- 過去に使用したファイル履歴の検索
			{
				"<C-f>",
				function()
					require("telescope.builtin").oldfiles()
				end,
				desc = "Telescope: 履歴検索",
			},
		},
	},
}
