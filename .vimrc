" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" trash directory
silent execute '!mkdir ~/.vim/vimtemp 2>/dev/null'
silent execute '!rm ~/.vim/vimtemp/* 2>/dev/null'
set directory=~/.vim/vimtemp/
set backupdir=~/.vim/vimtemp/
set undodir=~/.vim/vimtemp/

set incsearch     " increment search
set hlsearch      " highlight search results
set nu            " show lines numbers

" show existing tab with 3 spaces width
set tabstop=3
" when indenting with '>', use 3 spaces width
set shiftwidth=3
" On pressing tab, insert 3 spaces
set expandtab

set nocompatible              " be iMproved, required

"======================================================
" Highlight code
"======================================================

highlight Comment ctermfg=lightyellow

"======================================================
" Vundle settings
"======================================================

set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree' " Project and file navigation

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" NerdTree settings
" Show NERDTree F3
map <F3> :NERDTreeToggle<CR>
