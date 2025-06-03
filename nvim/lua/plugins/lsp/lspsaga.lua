return {
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({
				ui = {
					code_action = "",
				},
			})
			-- 診断エラーの修正
			vim.keymap.set("n", "ca", "<cmd>Lspsaga code_action<CR>")
			-- 診断エラーのある箇所へ移動
			vim.keymap.set("n", "c[", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
			vim.keymap.set("n", "c]", "<cmd>Lspsaga diagnostic_jump_next<CR>")

			-- 定義ファイルをフロート表示
			vim.keymap.set("n", "cd", "<cmd>Lspsaga peek_definition<CR>")
			-- 定義ファイル へ移動
			vim.keymap.set("n", "cg", "<cmd>Lspsaga goto_definition<CR>")

			-- ファインダー表示
			vim.keymap.set("n", "cf", "<cmd>Lspsaga finder<CR>")

			-- ドキュメント表示
			vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")

			-- アウトライン表示
			vim.keymap.set("n", "co", "<cmd>Lspsaga outline<CR>")

			-- ターミナルをフロート表示
			vim.keymap.set("n", "ct", "<cmd>Lspsaga term_toggle<CR>")

			-- 名前の一括変更
			vim.keymap.set("n", "cr", "<cmd>Lspsaga rename<CR>")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
}
