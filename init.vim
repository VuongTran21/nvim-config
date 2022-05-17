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

Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'onsails/lspkind.nvim'
Plug 'terrortylor/nvim-comment'

Plug 'mfussenegger/nvim-jdtls'

Plug 'akinsho/toggleterm.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'lewis6991/gitsigns.nvim'

Plug 'sbdchd/neoformat'

Plug 'janko/vim-test'
Plug 'tpope/vim-dispatch'
Plug 'neomake/neomake'
Plug 'itchyny/lightline.vim'

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

" enable global stausline
set laststatus=3
highlight WinSeparator guibg=None

" setting vim-test
" use the jest-vim-reporter to shorten the jest testoutput
let g:test#javascript#jest#options = '--reporters jest-vim-reporter'
" use neomake for async running of tests
let test#strategy = "neomake"
" do not open the test run results, can be changed to show them
let g:neomake_open_list = 0
" keybindings

" initially empty status
let g:testing_status = ''

" Start test
function! TestStarted() abort
  let g:testing_status = 'Test ⌛'
endfunction

" Show message when all tests are passing
function! TestFinished() abort
  let context = g:neomake_hook_context
  if context.jobinfo.exit_code == 0
    let g:testing_status = 'Test ✅'
  endif
  if context.jobinfo.exit_code == 1
    let g:testing_status = 'Test ❌'
  endif
endfunction

function! TestStatus() abort
  return g:testing_status
endfunction

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'teststatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'teststatus': 'TestStatus'
      \ },
      \ }

function! RunTestVerbose()
  let g:test#javascript#jest#options = '' 
  :TestNearest -strategy=neovim 
  let g:test#javascript#jest#options = '--reporters jest-vim-reporter'
endfunction

nnoremap <leader>tm :exec RunTestVerbose()<CR>
nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>ts :TestSuite<CR>
nnoremap <leader>tl :TestLast<CR>
nnoremap <leader>tv :TestVisit<CR>

augroup neomake_hook
  au!
  autocmd User NeomakeJobFinished call TestFinished()
  autocmd User NeomakeJobStarted call TestStarted()
augroup END

" install gcc for ubuntu to make c compilers available
" install xsel to make * and + register work
" note: remember to install language server when setting specific language in
" lsp
