vim.lsp.handlers["textDocument/publishDiagnostics"] =
	vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })

vim.cmd([[
set updatetime=500
highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#FFFFFF guibg=#103040
highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#FFFFFF guibg=#103040
highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#FFFFFF guibg=#103040
augroup lsp_document_highlight
  autocmd!
  autocmd CursorHold,CursorHoldI *.tsx,*.ts,*.js,*.rs lua vim.lsp.buf.document_highlight()
  autocmd CursorMoved,CursorMovedI *.tsx,*.ts,*.js,*.rs lua vim.lsp.buf.clear_references()
augroup END
]])
