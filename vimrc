let mapleader = " " " Map leader to Space

map <leader>s :w<CR>
map <leader>sq :wq<CR>
map <leader>qb :bd<CR>
map <leader>qq :q<CR>
map <leader>qf :qa!<CR>

nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>nn :bn<CR>

nnoremap <leader>l gt
nnoremap <leader>h gT

nnoremap <C-t> :tabnew<Space>
nnoremap <leader>th :set hlsearch!<cr>

" Toggle relative number with <leader>tr
nnoremap <silent> <leader>tr :set relativenumber!<CR>

" Split Horizontal by C+w _ and Vertical with C+w | 
nnoremap <C-w>_ <C-w>s 
nnoremap <C-w>\| <C-W>v

" ----------------------------------- Use a line cursor within insert mode and a block cursor everywhere else.
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
" ---------------------------------- Vim cursor shape configuration while opening and exiting 
let &t_ti .= "\e[2 q" " Block cursor
let &t_te .= "\e[4 q" " Line cursor


" ----------------------------------------------- Split border style
highlight VertSplit cterm=none gui=none
highlight LineNr ctermfg=grey

" ---------------------------------------------------- Highlight horizontal and vertical split bar 
highlight VertSplit cterm=NONE ctermfg=19
set cursorline
set cursorlineopt=number
highlight LineNr cterm=NONE ctermfg=grey ctermbg=233
highlight CursorLineNr cterm=NONE ctermfg=10 ctermbg=black

syntax on
set path+=**                          " Adds all subdirectories to the path
set wildignore+=*.class
set mouse=a                           " Enables mouse support in Vim
set showcmd                           " Show size of visual selection
set showmatch                         " Show matching braces
set nowrap                            " Don't wrap long lines
set wildmenu                          " Tab autocomplete in command mode
set ignorecase smartcase              " Search queries intelligently set case
set incsearch                         " Show search results as you type
set timeoutlen=1000 ttimeoutlen=0     " Remove timeout when hitting escape
set number ruler                      " Display line number
set ts=2 sts=2 sw=2 expandtab         " Set tab character to four space http://vimcasts.org/episodes/tabs-and-spaces/
set backspace=2   		                " Backspace deletes like most programs in insert mode
set nohlsearch
set t_Co=256                          " Set terminal color
set textwidth=140
set autowriteall
set background=dark

" -------------------- Open new split panes to right and bottom, which feels more natural than Vim’s default
set splitbelow
set splitright
