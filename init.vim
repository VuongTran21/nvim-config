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
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'folke/which-key.nvim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'onsails/lspkind.nvim'
Plug 'terrortylor/nvim-comment'

Plug 'akinsho/toggleterm.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'lewis6991/gitsigns.nvim'

Plug 'sbdchd/neoformat'

call plug#end()

colorscheme gruvbox

lua require("options")
lua require("keybindings")
lua require("treesitter-config")
lua require("nvim-tree-config")
lua require("lualine-config")
lua require("indent-blankline-config")
lua require("bufferline-config")
lua require("telescope-config")
lua require("colorizer-config")
lua require("gitsigns-config")
lua require("nvim-comment")
lua require("lsp")
lua require("toggle-term")
lua require("autopairs-config")
lua require("whichkey-config")
lua <<EOF
    print('hello from lua')
EOF

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap Y yg$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" greatest remap ever
xnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nmap <leader>Y "+Y

nnoremap <leader>d "_d
vnoremap <leader>d "_d

" install gcc for ubuntu to make c compilers available
" install xsel to make * and + register work
" note: remember to install language server when setting specific language in
" lsp
