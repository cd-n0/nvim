-- Check if jdtls is installed
local ensure_jdtls = function()
    local fn = vim.fn
    vim.env.PATH = vim.env.PATH .. ':' .. vim.env.HOME .. '/.local/bin/jdtls'
    local jdtls_installed = fn.executable('jdtls')
    if jdtls_installed == 0 then
        print("Installing jdtls...")
        -- Run the installation script
        local install_script = vim.env.HOME .. '/.config/nvim/ls-installers/install-jdtls.sh'
        vim.fn.system('sh ' .. install_script)
        return true
    end
    return false
end

local jdtls_installed = ensure_jdtls()
