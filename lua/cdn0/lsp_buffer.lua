function on_lsp_buffer_enabled()
    vim.opt.omnifunc = 'lsp#complete'
    vim.opt.signcolumn = 'yes'
    vim.api.nvim_buf_set_keymap(0, 'n', 'gi', '<plug>(lsp-definition)', {})
    vim.api.nvim_buf_set_keymap(0, 'n', 'gd', '<plug>(lsp-declaration)', {})
    vim.api.nvim_buf_set_keymap(0, 'n', 'gr', '<plug>(lsp-references)', {})
    vim.api.nvim_buf_set_keymap(0, 'n', 'gl', '<plug>(lsp-document-diagnostics)', {})
    vim.api.nvim_buf_set_keymap(0, 'n', '<f2>', '<plug>(lsp-rename)', {})
    vim.api.nvim_buf_set_keymap(0, 'n', '<f3>', '<plug>(lsp-hover)', {})
end

vim.api.nvim_command('augroup lsp_install')
vim.api.nvim_command('au!')
vim.api.nvim_command('autocmd User lsp_buffer_enabled call v:lua.on_lsp_buffer_enabled()')
vim.api.nvim_command('augroup END')
