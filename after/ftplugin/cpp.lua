if vim.env.NVIM_COMPILER_FLAGS == nil then vim.fn.setenv("NVIM_COMPILER_FLAGS", "-Wall -Wextra -Werror -g -std=c++ ") end
    
-- c++
vim.keymap.set("n", "<leader><leader>c", "<cmd>term cc -Wall -Wextra -Werror -g -std=c++11" .. vim.env.NVIM_COMPILER_FLAGS .. "'%' -o '%:r.out' && './%:r.out'<CR>", { silent = true })

-- make
vim.keymap.set("n", "<leader><leader>m", "<cmd>term sh -c 'for f in GNUmakefile makefile Makefile; do if [ -f \"$f\" ]; then TARGET=$(grep \"^TARGET\\s*=\" \"$f\" | cut -d\"=\" -f2- | tr -d \"[:space:]\"); ./$TARGET; break; fi; done'<CR>", { silent = true })

-- Keybind to edit the NVIM_COMPILER_FLAGS environment variable
vim.keymap.set("n", "<leader><leader>f", function () 
    flags = vim.env.NVIM_COMPILER_FLAGS
    flags = vim.fn.input('NVIM_COMPILER_FLAGS: ', flags)
    vim.fn.setenv("NVIM_COMPILER_FLAGS", flags)
    vim.cmd("source " .. vim.fn.stdpath "config" .. "/after/ftplugin/cpp.lua")
end
,{ silent = true })
