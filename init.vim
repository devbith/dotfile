" ------------------------------------------------------------ Vim-Plug plugin manager config 

call plug#begin()
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/vim-scripts/ReplaceWithRegister'
Plug 'michaeljsmith/vim-indent-object'
Plug 'christoomey/vim-system-copy'
Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive' 
Plug 'Yggdroot/indentLine'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'ellisonleao/glow.nvim'
Plug 'junegunn/fzf'
call plug#end()

"---------------------------------------------------------------------- Vim Highlightedyank
let g:highlightedyank_highlight_color = "rgba(160, 160, 160, 155)"
let g:highlightedyank_highlight_duration = 400
let g:highlightedyank_highlight_in_visual = 0

"--------------------------------------------------------------------- Enable indentLine plugin for yaml file type 
let g:indentLine_enabled = 1
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
let g:indentLine_char = '⦙'

" -------------------------------------------------------------------- Bottom status bar
 function! HasTrailingWhitespace()
   if search('\s\+$', 'n', line('.') + 0, line('$')) > 0
     return ' [trailing]'
   else
     return ''
   endif
 endfunction

set statusline=
set statusline+=%#LineNr#
set laststatus=2

" Use a divider to separate the left side from the right side.
set statusline+=%=
 
" Config for status line on right side.
set statusline+=%{fugitive#statusline()}
set statusline+=\ %m\ %M\ %y\ %{&fileencoding}\ %R
set statusline+=\ %l\:%c\ [%p%%]
set statusline+=%{HasTrailingWhitespace()}

" ---------------------------------------------------------------- Basic Save & Exist Mapping 

let mapleader = " "  " Leader key

map <leader>s :w<CR>
map <leader>sq :wq<CR>
map <leader>qb :bd<CR>
map <leader>qq :q!<CR>
map <leader>qf :qa!<CR>

"------------------------------------------------------------------ Mapping
nmap <leader>ff :Files<CR>
nmap <leader>fw :Rg 

" ----------------------------------------------------------------- General vim configuration 
set wildoptions-=pum                  " Horizontal wild menu
set showcmd                           " Show size of visual selection
set showmatch                         " Show matching braces
set ignorecase smartcase              " Search queries intelligently set case
set nowrap                            " Don't wrap long lines
set incsearch                         " Show search results as you type
set timeoutlen=1000 ttimeoutlen=0     " Remove timeout when hitting escape
set number ruler                      " Display line number
set ts=2 sts=2 sw=2 expandtab         " Set tab character to four space http://vimcasts.org/episodes/tabs-and-spaces/
set backspace=2   	              " Backspace deletes like most programs in insert mode
set nohlsearch
set noshowmode
set t_Co=256                          " Set terminal color
set background=dark                   " no comment
set textwidth=140
set autowriteall
