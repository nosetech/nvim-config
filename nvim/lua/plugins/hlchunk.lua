return {
	{
		"shellRaining/hlchunk.nvim",
		config = function()
			require("hlchunk").setup({
				chunk = {
					enable = true,
					use_treesitter = true,
					notify = true,
					exclude_filetypes = {
						aerial = true,
						dashboard = true,
					},
					support_filetypes = {
						"*.lua",
						"*.js",
						"*.ts",
						"*.tsx",
						"*.json",
					},
					chars = {
						horizontal_line = "─",
						vertical_line = "│",
						left_top = "╭",
						left_bottom = "╰",
						right_arrow = ">",
					},
					style = {
						{ fg = "#806d9c" },
					},
				},

				indent = {
					enable = true,
					use_treesitter = true,
					style = {
						{ fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui") },
					},
					chars = { "│" },
				},

				line_num = {
					enable = true,
					use_treesitter = false,
					style = "#806d9c",
				},

				blank = {
					enable = true,
					chars = {
						".",
					},
					style = {
						vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
					},
				},
			})
		end,
	},
}
