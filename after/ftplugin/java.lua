-- Check if jdtls is installed
vim.env.PATH = vim.env.PATH .. ':' .. vim.env.HOME .. '/.config/nvim/language_servers/jdtls'
local jdtls_installed = vim.fn.executable('jdtls')

local ensure_jdtls = function()
    if jdtls_installed == 0 then
        print("Installing jdtls...")
        -- Run the installation script
        local install_script = vim.env.HOME .. '/.config/nvim/ls-installers/install-jdtls.sh'
        vim.fn.system('sh ' .. install_script)
        return true
    end
    return false
end

-- Change == to ~= if you don't want to get prompted every single time open a java file if it's not installed
if jdtls_installed == 0 then
    vim.ui.input({ prompt = 'Would you like to install jdtls? Y/n: ' }, function(input)
        input = input:lower()

        while input ~= "y" and input ~= "n" and input ~= "" do
            print("Invalid input. Please enter 'Y' or 'n'.")
            vim.ui.input({ prompt = 'Would you like to install jdtls? Y/n: ' }, function(retry_input)
                input = retry_input or ""
                input = input:lower()
            end)
        end

        if input == "y" or input == "" then
            local jdtls_installed = ensure_jdtls()
            if jdtls_installed then
                print("\njdtls installed successfully!")
            else
                print("\nFailed to install jdtls.")
            end
        elseif input == "n" then
            print("\nInstallation skipped.")
        else
            print("\nInvalid input. Please enter 'Y' or 'n'.")
        end
    end)
end
