" ---------------------------------------------------------------- Basic Save & Exist Mapping
let mapleader = " "  " Leader key

function! CloseBufferOrVim(force='')
	exec 'write'
  if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    exec ("quit" . a:force)
    quit
  else
    exec ("bdelete" . a:force)
  endif
endfunction

nnoremap q <Nop>

map <leader>s :w<CR>
map <leader>sq :call CloseBufferOrVim()<CR>
map <leader>qq :call CloseBufferOrVim()<CR>
map <leader>qf :qa!<CR>

nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>nn :bn<CR>

nnoremap <leader>l gt
nnoremap <leader>h gT

nnoremap <leader>th :set hlsearch!<cr>
nnoremap <Leader>rw :%s/\<<C-r><C-w>\>//g<Left><Left>

" Toggle relative number with <leader>tr
nnoremap <silent> <leader>tr :set relativenumber!<CR>

" Split Horizontal by C+w _ and Vertical with C+w | 
nnoremap <C-w>_ <C-w>s 
nnoremap <C-w>\| <C-W>v

" Highlight horizontal and vertical split bar 
highlight VertSplit cterm=NONE ctermfg=19
set cursorline
set cursorlineopt=number
highlight LineNr cterm=NONE ctermfg=grey ctermbg=233
highlight CursorLineNr cterm=NONE ctermfg=10 ctermbg=black

set fillchars=stl:—     " fill active window's statusline with -
set fillchars+=stlnc:—  " also fill inactive windows
set fillchars+=vert:\|

let g:netrw_banner=0
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+,\(^\|\s\s\)ntuser\.\S\+'
autocmd FileType netrw set nolist


" lEasy Switch from NerdTree
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l

" Make adjusting split size bit eaiser
noremap <C-w><Left> :vertical resize +3<CR>
noremap <C-w><Right> :vertical resize -3<CR>
noremap <C-w><Up> :resize +3<CR>
noremap <C-w><Down> :resize -3<CR>


" Show file details
nnoremap <Leader>i :echo expand('%:p')<CR>

" More mapping
nmap <leader>ec !!zsh<CR>
nmap <leader>rc :source ~/.vim/vimrc<CR>

" Copy to system clipboard
nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
"
" " Paste from system clipboard
nnoremap <Leader>p "+P
vnoremap <Leader>p "+P


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
Plug 'junegunn/fzf.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'junegunn/fzf'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
call plug#end()

"---------------------------------------------------------------------- Vim Highlightedyank
let g:highlightedyank_highlight_color = "rgba(160, 160, 160, 155)"
let g:highlightedyank_highlight_duration = 400
let g:highlightedyank_highlight_in_visual = 0
let g:loaded_matchparen=1 

" ---------------------------------------------------------------------- Netrw & Nerdtree
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
let g:NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=60
let g:NERDTreeNodeDelimiter = "\u00a0"

nmap <silent> <leader>mm :NERDTreeToggle<CR>
nmap <silent> <leader>mf :NERDTreeFind<CR>

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
set statusline+=——————

"------------------------------------------------------------------ Search file and words. 
nmap <leader>ff :Files<CR>
"NOTE: Don't remove the whitepsace after Rg
nmap <leader>fw :Rg 

" ----------------------------------------------------------------- General vim configuration 
set path+=**                          " Adds all subdirectories to the path
set wildignore+=*.class               " Ignore *.class on find
set wildmenu                          " Tab autocomplete in command mode
set showcmd                           " Show size of visual selection
set showmatch                         " Show matching braces
set ignorecase smartcase              " Search queries intelligently set case
set nowrap                            " Don't wrap long lines
set incsearch                         " Show search results as you type
set timeoutlen=600 ttimeoutlen=0     " Remove timeout when hitting escape
set number ruler                      " Display line number
set ts=2 sts=2 sw=2 expandtab         " Set tab character to four space http://vimcasts.org/episodes/tabs-and-spaces/
set backspace=2   	                  " Backspace deletes like most programs in insert mode
set hidden                            " Switch buffers without saving them 
set nohlsearch
set noshowmode
set t_Co=256                          " Set terminal color
set background=dark                   " no comment
set textwidth=140
set autowriteall
set paste
set hlsearch
set mouse=a

autocmd BufEnter * set conceallevel=0

" Use a line cursor within insert mode and a block cursor everywhere else.
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Cursor shape configuration while opening vim and exiting Vim
let &t_ti .= "\e[2 q" " Block cursor
let &t_te .= "\e[4 q" " Line cursor

autocmd BufRead *.txt syntax match Statement /D:/ 
autocmd BufRead *.txt syntax match Constant /Q:/ 


nmap <leader>11 :.!toilet -w 200 -f term -F border<CR>
