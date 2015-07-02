" My vimrc file.
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"     for MS-DOS and Win32:  $VIM\_vimrc

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set backup		" keep a backup file
set history=50		" keep 50 lines of command line history
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

set hls
set autochdir
set nu
set expandtab
set tabstop=4
set softtabstop=4
"set backspace=2
set shiftwidth=4
filetype plugin on
filetype on
filetype indent on
syntax enable
set smartindent
set smarttab
set ambiwidth=double
set list
set foldmethod=syntax
set foldcolumn=4
set foldlevelstart=99

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gbk,cp936
set termencoding=utf-8

"set helplang=cn

" Enable omni completion.
autocmd FileType python set omnifunc=pythoncomplete#Complete

colorscheme default 
set guifont=Courier\ New\ 14
set mousehide

let s:extfname = expand("%:e")
if s:extfname ==? "py"
    iabbrev #e #!/usr/bin/env python<CR># -*- coding:utf-8 -*-<CR># author: zhanggang 

endif

"map plugins"
"nmap <F4> :NERDTree<CR>






