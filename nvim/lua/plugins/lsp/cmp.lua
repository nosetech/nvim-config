return {
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local lspkind = require("lspkind")
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			require("luasnip/loaders/from_vscode").lazy_load()
			require("luasnip.loaders.from_lua").lazy_load()
			cmp.setup({
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(), --Ctrl+pで補完欄を一つ上に移動
					["<C-n>"] = cmp.mapping.select_next_item(), --Ctrl+nで補完欄を一つ下に移動
					["<C-l>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<C-y>"] = cmp.mapping.confirm({ select = true }), --Ctrl+yで補完を選択確定
					["<CR>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							if luasnip.expandable() then
								luasnip.expand()
							else
								cmp.confirm({
									select = true,
								})
							end
						else
							fallback()
						end
					end),
					["<Tab>"] = cmp.mapping(function(fallback)
						if luasnip.locally_jumpable(1) then
							luasnip.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "luasnip", priority_weight = 20 },
					{ name = "copilot" },
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
				}),
				experimental = {
					ghost_text = false,
				},
				-- Lspkind(アイコン)を設定
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol", -- show only symbol annotations
						maxwidth = {
							-- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
							-- can also be a function to dynamically calculate max width such as
							-- menu = function() return math.floor(0.45 * vim.o.columns) end,
							menu = 50, -- leading text (labelDetails)
							abbr = 50, -- actual suggestion item
						},
						symbol_map = { Copilot = "" },
						ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
						show_labelDetails = true, -- show labelDetails in menu. Disabled by default

						-- The function below will be called before any actual modifications from lspkind
						-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
						before = function(entry, vim_item)
							-- ...
							return vim_item
						end,
					}),
				},
			})
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" }, --ソース類を設定
				},
			})
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "path" }, --ソース類を設定
				},
			})
		end,
	},
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"hrsh7th/cmp-buffer",
	},
	{
		"hrsh7th/cmp-path",
	},
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		config = function()
			vim.keymap.set("n", "<leader>es", require("luasnip.loaders").edit_snippet_files, { desc = "Edit snippets" })
		end,
	},
	{
		"saadparwaiz1/cmp_luasnip",
	},
	{
		"rafamadriz/friendly-snippets",
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
				copilot_node_command = "node",
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}
