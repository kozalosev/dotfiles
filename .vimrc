" Kozalo's Vim Configuration File
" Web resources that I used as a reference (except the standard help system, of course):
" - http://vim.wikia.com
" - https://github.com/spf13/spf13-vim/blob/3.0/.vimrc
" - https://github.com/alnyan/dotfiles/blob/master/nvim/init.vim

set nocompatible                " Be iMproved, not plain Vi
set t_Co=256                    " 256 colors
set t_ut=                       " Disable Background Color Erase (BCE) so that color schemes render properly
set hlsearch                    " Highlight search terms
set number                      " Line numbers on
set nowrap                      " Do not wrap long lines
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set shiftwidth=4                " Use indents of 4 spaces
set smarttab                    " Allow using <Tab> for indentation
set autoindent                  " Preserve indentation on line break
set smartindent                 " Detect closing brackets
set textwidth=120               " Make sure I don't write too much in a single line
set colorcolumn=+0              " Draw a vertical line to illustrate the value of 'textwidth'
set whichwrap+=<,>,h,l,[,]      " Make cursor jump to next line when reaching end of one
set mouse=a                     " Automatically enable mouse usage
set incsearch                   " Find as you type search
set ignorecase                  " Enable case insensitive search...
set smartcase                   " ...but only for lower-case strings
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set history=1000                " Store a ton of history

" Uncomment if you want to redefine some parameters in local .vimrc files within your projects
" set exrc
" set secure

" Commit messages are recommended to be 72 characters long
autocmd BufRead COMMIT_EDITMSG set textwidth=72

filetype off                    " Required for Vundle to work properly

" Set the runtime path to include Vundle and initialize it
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'               " Plugin manager
Plugin 'blueshirts/darcula'                 " Cool dark theme
Plugin 'scrooloose/nerdcommenter'           " Additional key bindings to comment/uncomment your code
Plugin 'scrooloose/nerdtree'                " File system explorer
Plugin 'airblade/vim-gitgutter'             " Show which lines have been added, modified, or removed
Plugin 'vim-airline/vim-airline'            " Status bar at the bottom
Plugin 'vim-airline/vim-airline-themes'     " Themes for vim-airline
Plugin 'ctrlpvim/ctrlp.vim'                 " Full path fuzzy finder
Plugin 'tpope/vim-surround'                 " Allow to replace quotes and braces easily
Plugin 'Townk/vim-autoclose'                " Close braces automatically
Plugin 'alvan/vim-closetag'                 " Close HTML tags automatically
Plugin 'mbbill/undotree'                    " Visualize undo-tree
Plugin 'mattn/emmet-vim'                    " Allow the use of Emmet to write HTML
Plugin 'udalov/kotlin-vim'                  " Support for the Kotlin language
Plugin 'bkad/camelcasemotion'               " Allow to move between parts of upperCased words

" All of plugins must be added before the following line
call vundle#end()

colorscheme darcula                 " The best dark theme (in my humble opinion)
let g:airline_theme='minimalist'
" let g:airline_theme='luna'        " Alternative good theme for Airline

scriptencoding utf-8
filetype plugin indent on           " Automatically detect file types
syntax on                           " Syntax highlighting

" Configure undoing
if has("persistent_undo")
    set undodir=~/.vim/.undodir/
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

" Strip trailing spaces on file save
fun! TrimWhitespace()
    let l:save=winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd BufWritePre * :call TrimWhitespace()

" Leave INSERT mode with Ctrl+l
inoremap <C-l> <Esc>
" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:let @/=""<CR><Esc>
" Insert blank lines with Ctrl+n (below current line) and Ctrl+m (above)
nnoremap <C-n> mao<Esc>`a
nnoremap <C-m> maO<Esc>`a
" Swap the current line with a next (Ctrl+j) or previous (Ctrl+k) one
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
" Toggle NERDTree with F2
noremap <silent> <F2> :NERDTreeToggle<CR>
" Press F3 to open the CtrlP panel
let g:ctrlp_map = '<F3>'
" Toggle search highlighting on F4
noremap <silent> <F4> :set hlsearch!<CR>
" Save the file on F5
noremap <F5> :w<CR>
" Reload the file on F6 if no changes have been made
noremap <F6> :edit<CR>
" Toggle spell checking on F7
noremap <silent> <F7> :set spell!<CR>

" Toggle menu with the history of a file with F8
noremap <silent> <F8> :UndotreeToggle<CR>
" Bind Ctrl+/ to comment toggling function
nnoremap <silent> <C-_> :call NERDComment(0, "Toggle")<Enter>

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" <C-h>: close popup and delete backword char.
inoremap <expr><C-h> pumvisible() ? "\<C-y>" : "\<C-h>"

""" Workaround to avoid CapsLock problem when leaving INSERT mode
""" Don't use CapsLock at all! Use Ctrl+^ instead!
" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor
for c in range(char2nr('А'), char2nr('Я'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor
" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0

" Enable usual key bindings with <\> to move between parts of cammelCase words.
call camelcasemotion#CreateMotionMappings('<leader>')

" Append a space after a comment sign
let g:NERDSpaceDelims=1
" The space is present by default in Python source files
autocmd BufRead *.py let NERDSpaceDelims=0

" Show hidden files in the file tree
let NERDTreeShowHidden=1

" Open NERDTree on start if no file was specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Restrict Emmet to only HTML and CSS files
let g:user_emmet_install_global=0
autocmd FileType html,css EmmetInstall
