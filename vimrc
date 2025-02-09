let mapleader = " " " Map leader to Space

" Double space and execute vim command
noremap <leader><leader> <S-:>

noremap <leader>s :w<CR>
noremap <leader>xx :wq!<CR>

noremap <Leader>y "+y
noremap <Leader>p "+p

nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>nn :bn<CR>

nnoremap <Leader>l gt
nnoremap <Leader>h gT

nnoremap <C-t> :tabnew<Space>
nnoremap <leader>th :set hlsearch!<cr>

" ----------------------------------------------------Toggle relative number with <leader>tr
nnoremap <silent> <leader>tr :set relativenumber!<CR>

"------------------------------------------ Split Horizontal by C+w _ and Vertical with C+w |
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

let g:loaded_matchparen=1  "Disable parenthesis highlight
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
set timeoutlen=700 ttimeoutlen=0      " Remove timeout when hitting escape
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
filetype plugin indent on


" Define abbreviation for Java files
autocmd FileType java :abbr sout System.out.println();<Esc>3h2x
autocmd FileType kotlin :abbr pl println()<Esc>
autocmd FileType java :abbr psvm public static void main(String[] args) {<CR>}<Esc>ko

"Disable syntax highlighting for Java and Kotlin files
autocmd BufReadPost,BufEnter *.java syntax off
autocmd BufReadPost,BufEnter *.kt syntax off
autocmd BufReadPost,BufEnter *.kts syntax off

" ------------------------------------------------------------ Status Line config
 function! HasTrailingWhitespace()
 	if search('\s\+$', 'n', line('.') + 0, line('$')) > 0
 		return ' [trailing]'
 	else
 		return ''
 	endif
 endfunction

" " Clear status line when vimrc is reloaded.
set statusline=
set statusline+=%#LineNr#

" " Use a divider to separate the left side from the right side.
set statusline+=%=

" " Status line right side.
set statusline+=\ %m\ %M\ %y\ %{&fileencoding}\ %R
set statusline+=\ %l\:%c\ [%p%%]
set statusline+=%{HasTrailingWhitespace()}

" " Show the status on the second to last line
set laststatus=2

" ----------------------------------------------------------------------------------------------------- Plugin
"
call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'mbbill/undotree'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'https://github.com/tpope/vim-surround'
  Plug 'https://github.com/tpope/vim-commentary'
  Plug 'machakann/vim-highlightedyank'
  Plug 'preservim/nerdtree'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'junegunn/vim-peekaboo'
  Plug 'vim-scripts/ReplaceWithRegister'
  Plug 'dense-analysis/ale'
call plug#end()


" -------------------------------------------------------------- vim-peekaboo
let g:peekaboo_prefix = "<leader>"

" -------------------------------------------------------------- undo-tree
if has("persistent_undo")
    let target_path = expand('~/.cache/vim-undo')
    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif
    let &undodir=target_path
    set undofile
endif

nnoremap <leader>uu :UndotreeToggle<CR>


" -------------------------------------------------------------- vim-highlight-yank
if !exists('##TextYankPost')
  nmap y <Plug>(highlightedyank)
  xmap y <Plug>(highlightedyank)
  omap y <Plug>(highlightedyank)
endif
let g:highlightedyank_highlight_duration = 600
" ---------------------------------------------------------------------------Netrw
let g:netrw_keepdir = 0
let g:netrw_winsize = 30
let g:netrw_localcopydircmd = 'cp -r'

" opens Netrw in the directory of the current file.
nnoremap <leader>dd :Lexplore %:p:h<CR>
" opens Netrw in the current working directory.
nnoremap <Leader>da :Lexplore<CR>

" ---------------------------------------------------------------------------FZF
noremap <leader>ff :Files<CR>
noremap <Leader>fg :Rg<CR>

" -------------------------------------------------------------------------- NerdTree Mapping
noremap <leader>m :NERDTreeToggle<CR>
noremap <leader>ef :NERDTreeFind<CR>
" maping source https://github.com/JetBrains/ideavim/blob/master/doc/NERDTree-support.md
let g:NERDTreeMapQuit = 'q'             " Close the NERDTree window
let g:NERDTreeMapNewFile = 'n'          " Create File
let g:NERDTreeMapNewDir = 'N'           " Create Directory
let g:NERDTreeMapDelete = 'd'           " Delete file or directory
let g:NERDTreeMapRefreshRoot = 'R'      " Recursively refresh the current root
let g:NERDTreeMapRefresh = 'r'          " Recursively refresh the current directory
let g:NERDTreeMapActivateNode = 'o'     " Open files, directories and bookmarks
let g:NERDTreeMapPreview =  'go'        " Open selected file, but leave cursor in the NERDTree
let g:NERDTreeMapOpenInTab = 't'        " Open selected node/bookmark in a new tab
let g:NERDTreeMapOpenInTabSilent = 'T'  " Same as 't' but keep the focus on the current tab


" hi TrailingWhitespace ctermbg=red guibg=red
" call matchadd("TrailingWhitespace", '\v\s+$')

