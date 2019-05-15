set number

set directory=~/.vim/tmp
set backupdir=~/.vim/tmp

set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent

set list
set listchars=tab:>-,trail:-,eol:↲,extends:>,precedes:<,nbsp:%

set hlsearch

if has("autocmd")
  augroup redhat
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

" START dein
" http://tweeeety.hateblo.jp/entry/2017/01/16/232800
set nocompatible              " be iMproved, required
filetype off                  " required
" https://qiita.com/delphinus/items/00ff2c0ba972c6e41542
" plugin install directory
let s:dein_dir = expand('~/.cache/dein')
" dein.vim
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" if no dein.vim install from github
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" start settings
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " plugin list TOML file
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " load and cash TOML
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " end settings
  call dein#end()
  call dein#save_state()
endif

" install if necessary
if dein#check_install()
  call dein#install()
endif
filetype plugin indent on    " required
" END dein

syntax on

"let g:jellybeans_overrides = {
"\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
"\}
colorscheme jellybeans

set colorcolumn=80
highlight ColorColumn ctermbg=240 guibg=#777777

set backspace=indent,eol,start
