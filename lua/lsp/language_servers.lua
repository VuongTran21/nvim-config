local home_path = os.getenv('HOME')
local sumneko_root_path = home_path .. "/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local languageservers = {
  'html',
  'cssls',
  'tsserver',
  'pyright',
  'intelephense',
  'emmet_ls',
  'angularls',
  'eslint',
  'graphql',
  'jsonls',
  'sqlls',
  'svelte',
  'tailwindcss',
  'terraform_lsp',
  'vimls',
  'vuels',
  'bashls',
  'dockerls',
  'sumneko_lua'
}

local opts = { capabilities = capabilities }

for _, server in ipairs(languageservers) do
  if (server == 'sumneko_lua') then
    opts = vim.tbl_deep_extend("force", {
      cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
          diagnostics = { globals = { 'vim' } },
          workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
          telemetry = { enable = false }
        }
      }

    }, opts)
  end
  require 'lspconfig'[server].setup(opts)
end
