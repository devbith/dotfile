let mapleader = " " " Map leader to Space

" Double space and execute vim command
noremap <leader><leader> <S-:>

noremap <leader>s :w<CR>
noremap <leader>xx :wq!<CR>

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>nn :bn<CR>

nnoremap <leader>l gt
nnoremap <leader>h gT

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

autocmd! bufreadpost *.java set syntax=off


" Define abbreviation for Java files
autocmd FileType java :abbr sout System.out.println("");<Esc>3h2x
autocmd FileType java :abbr psvm public static void main(String[] args) {<CR>}<Esc>ko

filetype plugin on
autocmd Filetype java source ~/.vim/cursor_output-main/java/cursor_output.vim
autocmd Filetype javascript source ~/.vim/cursor_output-main/javascript/cursor_output.vim

" ----------------------------------------------------------------------------------------------------- Plugin
"
call plug#begin()
  Plug 'mbbill/undotree'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  Plug 'https://github.com/tpope/vim-surround'
  Plug 'https://github.com/tpope/vim-commentary'
  Plug 'https://github.com/vim-scripts/ReplaceWithRegister'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'christoomey/vim-system-copy'
call plug#end()

" guard for distributions lacking the 'persistent_undo' feature.
if has('persistent_undo')
    let target_path = expand('~/.config/vim-persisted-undo/')
    let &undodir = target_path
    set undofile " finally, enable undo persistence.
endif


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
noremap <Leader>fw :Rg 
