-- Automatic Text Completion
function completion_complete()
    -- Quickly return if there's nothing to do
    if vim.fn.char2nr(vim.fn.nr2char(vim.v.char)) == 0 then
        return
    end

    local linetocursor = vim.fn.getline('.') .. vim.fn.nr2char(vim.v.char)

    -- Neovim occasionally freezes when showing the Completion menu. A
    -- workaround is to apply a minuscule delay to feedkeys, as described
    -- in this issue: https://github.com/neovim/neovim/issues/4572

    if string.match(linetocursor, '.\\{4,}$') then
        -- If last four characters are keyword chars, show full complete menu
        -- (results from 'complete')
        vim.fn.timer_start(0, function()
            vim.api.nvim_feedkeys((s_in_completion() and '<C-e>' or '') .. '<C-n>', 'n', true)
        end)
    elseif string.match(linetocursor, '.\\{3,}$') then
        -- If last three characters are keyword chars, show partial complete
        -- menu (keywords in current file) to improve performance.
        vim.fn.timer_start(0, function()
            vim.api.nvim_feedkeys((s_in_completion() and '<C-e>' or '') .. '<C-x><C-n>', 'n', true)
        end)
    end
end

-- Check if currently in insert mode completion.
function s_in_completion()
    return vim.fn.complete_info({ 'mode' }).mode ~= ''
end


-- Automatic Text Completion Configuration and Mappings
vim.o.completeopt = "menuone,noinsert,popup"
vim.o.complete = ".,w,b,u,t"
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.infercase = true

-- Tab to select completion
vim.api.nvim_set_keymap("i", "<Tab>", "pumvisible() ? '<C-y>' : '<Tab>'", { expr = true })

-- Enter closes completion menu
vim.api.nvim_set_keymap("i", "<CR>", "pumvisible() ? '<C-e><CR>' : '<CR>'", { expr = true })

-- Show completion as you type
vim.cmd([[
augroup completion_prompt_autocmd_group
    autocmd!
    autocmd InsertCharPre * call v:lua.completion_complete()
augroup END
]])
