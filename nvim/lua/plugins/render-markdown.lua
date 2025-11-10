return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		opts = {
			completions = { lsp = { enabled = true } },
			file_types = { "markdown", "mdx" },
		},
		config = function(_, opts)
			require("render-markdown").setup(opts)
			-- Automatically render markdown files when opened
			-- vim.api.nvim_create_autocmd("FileType", {
			--   pattern = "markdown",
			--   callback = function()
			--     require("render-markdown").render()
			--   end,
			-- })
		end,
	},
}
