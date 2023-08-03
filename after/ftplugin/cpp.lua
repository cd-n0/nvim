-- g++ just for ANSI check
vim.keymap.set("n", "<leader><leader>c", "<cmd>term g++ -Wall -Wextra -Werror -g -std=c89 '%' -o '%:r.out' && './%:r.out'<CR>", { silent = true })

-- make
vim.keymap.set("n", "<leader><leader>m", "<cmd>term sh -c 'for f in GNUmakefile makefile Makefile; do if [ -f \"$f\" ]; then TARGET=$(grep \"^TARGET\\s*=\" \"$f\" | cut -d\"=\" -f2- | tr -d \"[:space:]\"); ./$TARGET; break; fi; done'<CR>", { silent = true })
