local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- LSP Support
    use 'neovim/nvim-lspconfig'             -- Required
    use 'nvim-treesitter/nvim-treesitter'
    use 'lervag/vimtex'
    use 'ray-x/lsp_signature.nvim'
    use 'mfussenegger/nvim-jdtls'
    use 'mbbill/undotree'
    use 'tpope/vim-surround'
    use({
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    })
    use 'iurimateus/luasnip-latex-snippets.nvim'
	if packer_bootstrap then
		require('packer').sync()
	end
end)
