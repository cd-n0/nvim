-- Check if jdtls is installed
local jdtls_install_path = vim.env.HOME .. '/.config/nvim/language_servers/jdtls'
vim.env.PATH = vim.env.PATH .. ':' .. jdtls_install_path
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
                print("jdtls installed successfully!")
            else
                print("Failed to install jdtls.")
            end
        elseif input == "n" then
            print("Installation skipped.")
        else
            print("Invalid input. Please enter 'Y' or 'n'.")
        end
    end)
end

-- Check again to set the variable if they installed it
jdtls_installed = vim.fn.executable('jdtls')

if jdtls_installed == 1 then
    local project_path = vim.fn.getcwd()
    local equinox_launcher_file_path = vim.fn.system('ls ' .. jdtls_install_path .. '/plugins/org.eclipse.equinox.launcher_*.jar | tr -d "\n"')
    -- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
    local config = {
        -- The command that starts the language server
        -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
        cmd = {

            -- 💀
            'java', -- or '/path/to/java21_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.

            '-Declipse.application=org.eclipse.jdt.ls.core.id1',
            '-Dosgi.bundles.defaultStartLevel=4',
            '-Declipse.product=org.eclipse.jdt.ls.core.product',
            '-Dlog.protocol=true',
            '-Dlog.level=ALL',
            '-Xmx1g',
            '--add-modules=ALL-SYSTEM',
            '--add-opens', 'java.base/java.util=ALL-UNNAMED',
            '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

            -- 💀
            '-jar', equinox_launcher_file_path,
            -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
            -- Must point to the                                                     Change this to
            -- eclipse.jdt.ls installation                                           the actual version


            -- 💀
            '-configuration', jdtls_install_path .. '/config_linux',
            -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
            -- Must point to the                      Change to one of `linux`, `win` or `mac`
            -- eclipse.jdt.ls installation            Depending on your system.


            -- 💀
            -- See `data directory configuration` section in the README
            '-data', jdtls_install_path .. '/workspace_folder' .. project_path,
        },

        -- 💀
        -- This is the default if not provided, you can remove it. Or adjust as needed.
        -- One dedicated LSP server & client will be started per unique root_dir
        --
        -- vim.fs.root requires Neovim 0.10.
        -- If you're using an earlier version, use: require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
        root_dir = vim.fs.root(0, {".git", "mvnw", "gradlew"}),

        -- Here you can configure eclipse.jdt.ls specific settings
        -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
        -- for a list of options
        settings = {
            java = {
            }
        },

        -- Language server `initializationOptions`
        -- You need to extend the `bundles` with paths to jar files
        -- if you want to use additional eclipse.jdt.ls plugins.
        --
        -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
        --
        -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
        init_options = {
            bundles = {}
        },
    }
    -- This starts a new client & server,
    -- or attaches to an existing client & server depending on the `root_dir`.
    require('jdtls').start_or_attach(config)
end
