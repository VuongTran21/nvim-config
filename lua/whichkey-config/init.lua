local wk = require("which-key")
local mappings = {
  q = {":q<cr>", "Quit"},
  Q = {":wq<cr>", "Save & Quit"},
  w = {":w<cr>", "Save"},
  x = {":bdelete<cr>", "Close"},
  f = {":Telescope find_files<cr>", "Telescope find files"},
  r = {":Telescope live_grep<cr>", "Telescope live grep"}
}

local opts = {
  prefix =  '<leader>'
}
wk.register(mappings, opts)
