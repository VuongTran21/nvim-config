local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
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
  'java_language_server',
  'sqlls',
  'svelte',
  'tailwindcss',
  'terraform_lsp',
  'vimls',
  'vuels',
  'bashls',
  'dockerls'
}

for _, server in ipairs(languageservers) do
  require'lspconfig'[server].setup {
    capabilities = capabilities
  }
end

