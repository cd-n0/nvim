--tcc
vim.keymap.set("n", "<leader><leader>c", "<cmd>term tcc -Wall -Wextra -Werror -g '%' -o '%:r.out' && './%:r.out'<CR>", { silent = true })

-- tcc run
vim.keymap.set("n", "<leader><leader>r", "<cmd>term tcc -Wall -Wextra -Werror -run '%' <CR>", { silent = true })

-- make
vim.keymap.set("n", "<leader><leader>m", "<cmd>term sh -c 'for f in GNUmakefile makefile Makefile; do if [ -f \"$f\" ]; then TARGET=$(grep \"^TARGET\\s*=\" \"$f\" | cut -d\"=\" -f2- | tr -d \"[:space:]\"); ./$TARGET; break; fi; done'<CR>", { silent = true })

-- gcc just for ANSI check
vim.keymap.set("n", "<leader><leader>g", "<cmd>term gcc -Wall -Wextra -Werror -g -std=c89 '%' -o '%:r.out' && './%:r.out'<CR>", { silent = true })
