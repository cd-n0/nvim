-- leader key
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "
-- vim.api.nvim_set_keymap()
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


-- ThePrimagen's vim bindings he has a great channel check him out
-- vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", "\"_dP")

-- next greatest remap ever : asbjornHaland
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>jc", "<cmd>!./javacompile<CR>")
vim.keymap.set("n", "<leader>jr", "<cmd>!./javarun<CR>")
vim.keymap.set("n", "<leader>gc", "<cmd>!./gradlew build<CR>")
vim.keymap.set("n", "<leader>gr", "<cmd>!./gradlew runClient<CR>")

vim.keymap.set("v", "<C-l>", "<cmd>lua require('luasnip').jump(1)<CR>")
vim.keymap.set("v", "<C-h>", "<cmd>lua require('luasnip').jump(-1)<CR>")

vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_quickfix_mode = 0
vim.opt.conceallevel = 1
vim.g.tex_conceal = 'abdmg'
--  Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
--	set splitbelow splitright
--  Enable autocompletion:
vim.opt.wildmode = "longest,list,full"
