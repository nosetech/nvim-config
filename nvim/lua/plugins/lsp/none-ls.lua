return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        debug = false,
        sources = {
          null_ls.builtins.formatting.prettier.with({
            prefer_local = "node_modules/.bin/prettier",
            filetypes = {
              "html",
              "css",
              "javascript",
              "typescript",
              "javascriptreact",
              "typescriptreact",
              "json",
            },
          }),
          null_ls.builtins.formatting.stylua.with({
            filetypes = { "lua" },
          }),
        },
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function(args)
          vim.lsp.buf.format({
            bufnr = args.buf,
            timeout_ms = 3000,
            async = false,
          })
        end,
      })
    end,
  },
}
