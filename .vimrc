" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

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

" find additional .vimrc in startup dir
"set exrc
" stay secure when add additional .vimrc
"set secure

" show existing tab with 3 spaces width
set tabstop=3
" when indenting with '>', use 3 spaces width
set shiftwidth=3
" On pressing tab, insert 3 spaces
set expandtab

"======================================================
" Highlight code
"======================================================

" Comments color
highlight Comment ctermfg=LightYellow

" / search highlighting
highlight IncSearch ctermbg=Black ctermfg=White

" Set highlight for *.pc files
au BufRead,BufNewFile *.pc set filetype=c

" Cscope results 
highlight ModeMsg ctermfg=Magenta

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
" Add ident lines. To toggle - :IndentLinesToggle.
Plugin 'Yggdroot/indentLine'
" Git blame
Plugin 'tpope/vim-fugitive'

"Plugin 'Valloric/YouCompleteMe' " Completion plugin

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

" Cscope settings
" Scope. Update.
function UpdateCScopeDB()
   let curdir = getcwd()

   while !filereadable("cscope.out") && getcwd() != "/"
      cd ..
   endwhile

   if filereadable("cscope.out")
      cs kill 0
      execute ":silent! !rm -f ./cscope.*"
      execute ':silent! !find ./ -name "*.c" -o -name "*.pc" -o -name "*.h" > cscope.files'
      execute ':silent! !cscope -b -q -i cscope.files'
      execute "cs add " . getcwd() . "/cscope.out "
      redraw!
   endif
   execute "cd" . curdir
endfunction

" Scope. For find calling function
function SetCScopeFile()
   if filereadable("cscope.out")
      execute "cs add " . getcwd() . "/cscope.out "
   endif
endfunction

if has("cscope")
   set cst
   nmap <F11> :call UpdateCScopeDB()<CR>
   call SetCScopeFile()
endif

" disable comment autoadd
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
