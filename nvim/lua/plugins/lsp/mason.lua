return {
	{
		"neovim/nvim-lspconfig",
	},
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function(server_name)
			local on_attach = function(client, bufnr)
				-- LSPが持つフォーマット機能を無効化する
				client.server_capabilities.documentFormattingProvider = false
			end

			-- 補完プラグインであるcmp_nvim_lspをLSPと連携させています（後述）
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- この一連の記述で、mason.nvimでインストールしたLanguage Serverが自動的に個別にセットアップされ、利用可能になります
			require("mason-lspconfig").setup({
				function(server_name)
					require("lspconfig")[server_name].setup({
						on_attach = on_attach, --keyバインドなどの設定を登録
						capabilities = capabilities, --cmpを連携
					})
				end,
			})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason-org/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				automatic_setup = true,
				handlers = {},
			})
		end,
	},
}
