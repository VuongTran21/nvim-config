local wk = require("which-key")
local mappings = {
  q = {":q!<cr>", "Quit without save"},
  Q = {":wq<cr>", "Save & Quit"},
  w = {":w<cr>", "Save"},
  x = {":bdelete<cr>", "Close"},
  b = {":NvimTreeFindFile<cr>", "Located file in tree"},
  l = {
    name = "LSP",
    i = {":LspInfo<cr>", "Connected Language Servers"},
    k = {"<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help"},
    K = {"<cmd>lua vim.lsp.buf.hover()<CR>", "Hover Commands"},
    w = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', "Add Workspace Folder"},
    W = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>', "Remove Workspace Folder"},
    l = {
      '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>',
      "List Workspace Folders"
    },
    t = {'<cmd>lua vim.lsp.buf.type_definition()<cr>', "Type Definition"},
    d = {'<cmd>lua vim.lsp.buf.definition()<cr>', "Go To Definition"},
    D = {'<cmd>lua vim.lsp.buf.declaration()<cr>', "Go To Declaration"},
    r = {'<cmd>lua vim.lsp.buf.references()<cr>', "References"},
    R = {'<cmd>lua vim.lsp.buf.rename()<CR>', "Rename"},
    a = {'<cmd>lua vim.lsp.buf.code_action()<CR>', "Code Action"},
    f = {'<cmd>Neoformat<CR>', "Format code"},
    e = {'<cmd>lua vim.diagnostic.open_float()<CR>', "Show Line Diagnostics"},
    n = {'<cmd>lua vim.diagnostic.goto_prev()<CR>', "Go To Next Diagnostic"},
    N = {'<cmd>lua vim.diagnostic.goto_next()<CR>', "Go To Previous Diagnostic"}
  }
}

local opts = {
  prefix =  '<leader>'
}
wk.register(mappings, opts)
