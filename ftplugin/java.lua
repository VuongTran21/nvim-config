local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local home_path = os.getenv('HOME')

local function get_os_name()
  local os_name = vim.loop.os_uname().sysname
  if (os_name == 'Darwin') then
    return 'mac'
  else
    return 'linux'
  end
end

local configuration = home_path .. '/.local/share/java/jdt-language-server-1.9.0-202203031534/config_' .. get_os_name()

local config = {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-noverify',
    '-Xms1g',
    '-jar', home_path .. '/.local/share/java/jdt-language-server-1.9.0-202203031534/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
    '-configuration', configuration,
    '-data', home_path .. '/.cache/jdtls-workspace' .. project_name
  },

  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
  capabilities = capabilities
}

require('jdtls').start_or_attach(config)

