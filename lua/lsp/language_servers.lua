local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local languageservers = {
  'html',
  'cssls',
  'tsserver',
  'pyright'
}

for _, server in ipairs(languageservers) do
  require'lspconfig'[server].setup {
    capabilities = capabilities
  }
end

-- npm install -g emmet-ls
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.emmet_ls.setup({
    -- on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "html", "css", "typescriptreact", "javascriptreact" },
})
