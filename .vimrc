execute pathogen#infect()
set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

"set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" set Go Lang
"set rtp+=/panfs/panfs.ihep.ac.cn/home/data/lint/FunTest/download/golang/go/misc/vim

set hls
set autochdir
set nu
set expandtab
set tabstop=2
set softtabstop=4
"set backspace=2
set nobackup
set shiftwidth=2
set autoindent
filetype plugin on
filetype on
filetype plugin indent on
filetype indent on
syntax enable
syntax on
set smartindent
set smarttab
set ambiwidth=double
set list
set listchars=tab:\|\ 
set foldmethod=syntax
set foldcolumn=4
set foldlevelstart=99
"fortran
"let s:extfname = expand("%:e")
"if s:extfname ==? "f90"
let fortran_free_source=1
unlet! fortran_fixed_source
"else
"    let fortran_fixed_source=1
"    unlet! fortran_free_source
"endif
let fortran_more_precise=1
let fortran_do_enddo=1
let fortran_fold=1
let fortran_fold_conditionals=1

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,gbk,cp936
set termencoding=utf-8
set incsearch
set wildmenu
map <c-w><c-f> :FirstExplorerWindow<cr>
map <c-w><c-b> :BottomExplorerWindow<cr>
map <c-w><c-t> :WMToggle<cr> 
let g:winManagerWindowLayout='FileExplorer|TagList|BufExplorer'
let g:winManagerWidth=35
nmap <F3> :WMToggle<cr>

set langmenu=zh_CN.UTF-8
"source /afs/ihep.ac.cn/users/l/lint/bin/vim/share/vim/vim72/delmenu.vim
"source /afs/ihep.ac.cn/users/l/lint/bin/vim/share/vim/vim72/menu.vim
""source /ihepbatch/besd13/lint/bin/vim73/share/vim/vim73/delmenu.vim
language messages zh_CN.utf-8
set helplang=cn
autocmd FileType python set omnifunc=pythoncomplete#Complete

colorscheme default 
set guifont=Courier\ New\ 14
set mouse=r
set mousehide
set pastetoggle=<F11>


let s:extfname = expand("%:e")
if s:extfname ==? "py"
    iabbrev #e #!/usr/bin/env python<CR># -*- coding:utf-8 -*-<CR># author: zhanggang 

endif

"let extfname = expand("%:e")
"if extfname
"    set autochdir
"endif

"set tags+=/afs/ihep.ac.cn/users/l/lint/GangaHome/5.5.25/install/5.5.25/python/tags

"set tags+=/ihepbatch/bes/lint/workarea/BesVis/EventDisplay/tags
"set tags+=/ihepbatch/bes/lint/workarea/Dyb2/dyb2-lintao/dyb2geant4test/dyb2/tags
"set tags+=/ihepbatch/bes/lint/workarea/BesVis/EventDisplay/BesVisLib/BesVisLib-00-04-03


"map plugins"
nmap <F4> :NERDTree<CR>
nmap <F5> :TagbarToggle<CR>
map <C-l> :tabn<cr>             "下一个tab
map <C-h> :tabp<cr>             "上一个tab
map <C-n> :tabnew<cr>           "新tab
map <C-k> :bn<cr>               "下一个文件
map <C-j> :bp<cr>               "上一个文件

function! SwitchToBuf(filename)
    "let fullfn = substitue(a:filename, "^\\~/", $HOME ,"/", "")
    "find in current tab
    let bufwinnr = bufwinnr(a:filename)
    if bufwinnr != -1
        exec bufwinnr . "wincmd w"
        return 
    else
        "find in each tab
        tabfirst
        let tab = 1
        while tab <= tabpagenr("$")
            let bufwinnr = bufwinnr(a:filename)
            if bufwinnr != -1
                exec "normal" . tab . "gt"
                exec bufwinnr . "wincmd w"
                return
            endif
            tabnext
            let tab = tab +1
        endwhile
        "not exit, new tab
        exec "tabnew" . a:filename
    endif
endfunction
"fast reloading fo the .vimrc
"
let mapleader = ","
map <leader>s :source ~/.vimrc<cr>
map <leader>e :call SwitchToBuf("~/.vimrc")<cr>
autocmd! bufwritepost .vimrc source ~/.vimrc


"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'



" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
