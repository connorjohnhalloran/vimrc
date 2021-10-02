let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Plugins
call plug#begin('~/.vim/vim-plug')
	Plug 'dikiaap/minimalist'      " Color scheme
	Plug 'blueyed/vim-diminactive' " Highlights active split
	Plug 'tpope/vim-fugitive'      " Git wrapper
	Plug 'tpope/vim-commentary'    " Better comment editing
	Plug 'tpope/vim-surround'      " Surrounding pair operations
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set number
set relativenumber
set cursorline
set colorcolumn=80
set hlsearch
set backspace=indent,eol,start
syntax on

syntax on
colorscheme minimalist

" Overrides for minimalist colorscheme
hi VertSplit ctermbg=NONE ctermfg=255

hi ColorColumn ctermbg=233
hi CursorLine ctermbg=236
hi CursorLineNR ctermbg=236 ctermfg=250
hi Search ctermbg=237
hi EndOfBuffer ctermbg=233 ctermfg=233

" Netrw file tree settings
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 25

" COC settings
set updatetime=300    " Increases responsiveness
set signcolumn=number " Use number column for COC messages

" COC style
hi CocErrorSign ctermbg=red ctermfg=255
hi CocWarningSign ctermbg=yellow ctermfg=black
hi CocErrorHighlight ctermbg=red ctermfg=255
hi CocWarningHighlight ctermbg=yellow ctermfg=black
