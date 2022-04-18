call plug#begin(stdpath("data") . "/vimplug")

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'gruvbox-community/gruvbox'

Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'windwp/nvim-ts-autotag'
Plug 'p00f/nvim-ts-rainbow'
Plug 'windwp/nvim-autopairs'
Plug 'folke/which-key.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'onsails/lspkind.nvim'

call plug#end()

colorscheme gruvbox

lua require("options")
lua require("keybindings")
lua require("nvim-tree-config")
lua require("lualine-config")
lua require("bufferline-config")
lua require("treesitter-config")
lua require("telescope-config")
lua require("lsp")
lua require("autopairs-config")
lua require("whichkey-config")
lua <<EOF
    print('hello from lua')
EOF


" install gcc for ubuntu to make c compilers available
" install xsel to make * and + register work
" note: remember to install language server when setting specific language in
" lsp
