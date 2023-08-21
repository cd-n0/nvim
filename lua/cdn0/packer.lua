-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'navarasu/onedark.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
    use (
    'nvim-treesitter/nvim-treesitter',
    {run = ':TSUpdate'}
    )
    use 'nvim-treesitter/playground'
    -- LSP Support
    use 'neovim/nvim-lspconfig'             -- Required
    use 'williamboman/mason.nvim'           -- Optional
    use 'williamboman/mason-lspconfig.nvim' -- Optional

    -- Autocompletion
    use 'hrsh7th/nvim-cmp'         -- Required
    use 'hrsh7th/cmp-nvim-lsp'     -- Required
    use 'hrsh7th/cmp-buffer'       -- Optional
    use 'hrsh7th/cmp-path'         -- Optional
    use 'saadparwaiz1/cmp_luasnip' -- Optional
    use 'hrsh7th/cmp-nvim-lua'     -- Optional

    -- Snippets
    use {
        "L3MON4D3/LuaSnip",
        requires = { "rafamadriz/friendly-snippets" },
    } -- Required

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use 'ThePrimeagen/vim-be-good'
    use 'ThePrimeagen/harpoon'
    use 'mfussenegger/nvim-jdtls'
    use 'mfussenegger/nvim-dap'
    use 'lervag/vimtex'
    use 'junegunn/goyo.vim'
    use 'vimwiki/vimwiki'
    use 'lukas-reineke/indent-blankline.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'norcalli/nvim-colorizer.lua'
    use '42Paris/42header'
end)
