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

			vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>")
			vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>")
			vim.keymap.set("n", "<C-t>l", "<cmd>BufferLineMoveNext<cr>")
			vim.keymap.set("n", "<C-t>h", "<cmd>BufferLineMovePrev<cr>")
			vim.keymap.set("n", "<C-t>wl", "<cmd>BufferLineCloseRight<cr>")
			vim.keymap.set("n", "<C-t>wh", "<cmd>BufferLineCloseLeft<cr>")
			vim.keymap.set("n", "<C-t>ww", "<cmd>BufferLinePickClose<cr>")
		end,
	},
}
