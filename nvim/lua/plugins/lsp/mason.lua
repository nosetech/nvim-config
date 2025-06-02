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
				-- →例えばtsserverはデフォルトでフォーマット機能を提供しますが、利用したくない場合はコメントアウトを解除してください
				--client.server_capabilities.documentFormattingProvider = false

				-- 下記ではデフォルトのキーバインドを設定しています
				-- ほかのLSPプラグインを使う場合（例：Lspsaga）は必要ないこともあります
				local set = vim.keymap.set
				set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
				set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
				set("n", "<C-m>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
				set("n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
				set("n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
				set("n", "ma", "<cmd>lua vim.lsp.buf.code_action()<CR>")
				set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
				set("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
				set("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
				set("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
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
