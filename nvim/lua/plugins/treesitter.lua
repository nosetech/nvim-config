return {
	{
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
			require("nvim-treesitter.configs").setup({
				-- A list of parser names, or "all"
				ensure_installed = {
					"lua",
					"bash",
					"css",
					"dockerfile",
					"go",
					"html",
					"javascript",
					"python",
					"rust",
					"typescript",
					"tsx",
					"json",
					"astro",
					"markdown",
				},

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = true,

				-- Automatically install missing parsers when entering buffer
				auto_install = true,

				highlight = {
					-- `false` will disable the whole extension
					enable = true,

					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},
}
