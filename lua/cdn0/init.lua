require("cdn0.packer")
require("cdn0.remap")
require("cdn0.folds")

-- colorscheme
vim.cmd.colorscheme('habamax')

-- Line numbers for fast navigation
vim.opt.nu = true
vim.opt.relativenumber = true

-- leader key
vim.keymap.set({"n","v"}, "<Space>", "<Nop>", { silent = true, remap = false})
vim.g.mapleader = " "
--clipboard to system clipboard
-- vim.opt.clipboard = 'unnamedplus'
-- mouse mode for all
vim.o.mouse = 'a'
-- syntax pretty self explanatory
vim.o.syntax = 'on'
-- statusline visible at all times
vim.opt.laststatus= 2

-- Linebreak/wrap
vim.opt.linebreak = false
vim.opt.wrap = false

-- 4 instead of 8 indent
vim.opt.tabstop = 4
vim.opt.softtabstop= 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- undo stuff
vim.opt.undodir = vim.fn.stdpath("data") .. "/nvim/undodir"
vim.opt.undofile = true

-- I get that they are useful but mostly they are annoying
vim.opt.swapfile = false
vim.opt.backup = false

-- search highlight stuff
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Enables 24-bit RGB color in the TUI
vim.opt.termguicolors = true

-- have n lines of space unless its the start or end of a file
vim.opt.scrolloff = 0

-- Disable the signcolumn
vim.opt.signcolumn = "no"

-- append the @ symbol to go to the file with gf
vim.opt.isfname:append("@-@")

-- faster updatetime
vim.opt.updatetime = 50
-- colorcolumn for style
vim.opt.colorcolumn = "80"

--  Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
vim.opt.splitright = true
vim.opt.splitbelow = true

--  Enable autocompletion:
vim.opt.wildmode = "longest,list,full"

-- Disable automatic comment insertion
-- Use <C-u> instead
-- vim.api.nvim_create_autocmd("BufEnter", {
--     callback = function()
--         vim.opt.formatoptions:remove {"c", "r", "o"}
--     end,
--     group = general,
--     desc = "Disable newline comment",
-- })

vim.g.netrw_liststyle = 1
