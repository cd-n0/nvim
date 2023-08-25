require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup {
    ensure_installed = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'lua_ls', 'jedi_language_server' },
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()
mason_lspconfig.setup_handlers {
  function (server_name)
    require('lspconfig')[server_name].setup({
        capabilities = capabilities,
    })
  end
}
