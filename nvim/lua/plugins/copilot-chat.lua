return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim" },
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			-- See Configuration section for options
		},
		-- See Commands section for default commands if you want to lazy load on them
		config = function()
			require("CopilotChat").setup({
				show_help = "yes",
				prompts = {
					Explain = {
						prompt = "/COPILOT_EXPLAIN コードを日本語で説明してください",
						mapping = "<leader>ce",
						description = "コードの説明をお願いする",
					},
					Review = {
						prompt = "/COPILOT_REVIEW コードを日本語でレビューしてください。",
						mapping = "<leader>cr",
						description = "コードのレビューをお願いする",
					},
					Fix = {
						prompt = "/COPILOT_FIX このコードには問題があります。バグを修正したコードを表示してください。説明は日本語でお願いします。",
						mapping = "<leader>cf",
						description = "コードの修正をお願いする",
					},
					Optimize = {
						prompt = "/COPILOT_REFACTOR 選択したコードを最適化し、パフォーマンスと可読性を向上させてください。説明は日本語でお願いします。",
						mapping = "<leader>co",
						description = "コードの最適化をお願いする",
					},
					Docs = {
						prompt = "/COPILOT_GENERATE 選択したコードに関するドキュメントコメントを日本語で生成してください。",
						mapping = "<leader>cc",
						description = "コードのドキュメント作成をお願いする",
					},
					Tests = {
						prompt = "/COPILOT_TESTS 選択したコードの詳細なユニットテストを書いてください。説明は日本語でお願いします。",
						mapping = "<leader>ct",
						description = "テストコード作成をお願いする",
					},
					Commit = {
						prompt = "実装差分に対するコミットメッセージを日本語で記述してください。",
						mapping = "<leader>cg",
						description = "コミットメッセージの作成をお願いする",
						selection = require("CopilotChat.select").gitdiff,
					},
				},
			})
			-- チャット画面の表示・非表示
			vim.keymap.set("n", "<leader>chat", "<cmd>CopilotChatToggle<CR>")

			-- 出力の停止
			vim.keymap.set("n", "<leader>stop", "<cmd>CopilotChatStop<CR>")

			-- チャット画面のリセット
			vim.keymap.set("n", "<leader>reset", "<cmd>CopilotChatReset<CR>")
		end,
	},
}
