return {
	{
		"akinsho/bufferline.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",
					show_buffer_icons = false,
					show_buffer_close_icons = false,
					show_close_icon = false,
					separator_style = "thin",
				},
			})
			vim.opt.list = true
			vim.opt.listchars:append("space:⋅")
			vim.opt.listchars:append("eol:↴")
			vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E5C07B gui=nocombine]])
		end,
	},
}
