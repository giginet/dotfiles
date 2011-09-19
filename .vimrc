"Initialize Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"General Settings
set cindent
set cinoptions=g0
set directory=$HOME/.vimbackup
set smartindent
set title
set mouse=a

"Language Settings
set encoding=utf8
set hlg=ja

"Edit Settings
set tabstop=2
set shiftwidth=2
set expandtab     "replace tab to spaces
set showmatch     "auto complete )
set matchtime=1   "wait time for showmatch
set backspace=indent,eol,start

"Display Settings
set number
set list
set ruler
set nowrap
set shellslash

"Search Settings
set hlsearch       "enable highligt
set incsearch      "enable incremental search
set smartcase      "enable smart case
set grepprg=grep\ -nH\ $*

"Plugin Settings
filetype on
filetype plugin on
filetype plugin indent on
filetype indent on
syntax on

"Color Scheme
colorscheme summerfruit

"Key Mappings
noremap <C-z> :tabp<CR>
noremap <C-x> :tabn<CR>
"noremap <C-t> gg=G<C-o><C-o>
noremap r :redo<CR>
noremap <C-o> :tabnew 
noremap <C-t> :new<CR>

"mapping like tmux
noremap <C-w>% :vsp<CR>
noremap <C-w>" :sp<CR>

"Bundle Universal Plugins
Bundle 'quickrun'
Bundle 'unite.vim'
Bundle 'The-NERD-tree'
au BufNewFile *.js set ft=javascript

au BufNewFile,BufRead *.tex,*.latex,*.sty,*.dtx,*.ltx,*.bbl setf tex
au BufReadPost,BufNewFile *.t :setl filetype=perl
au BufReadPost,BufNewFile *.tt :set filetype=tt2html

"NERDTree Settings
function! ToggleNAEDTree()
  let current = expand('%:p')
  execute printf(':NERDTreeToggle %s', current)
endfunction
noremap t :call ToggleNAEDTree()<CR>  "toggle NERDTree display
let NERDTreeShowHidden = 1            "show dotfiles on NERDTree

"Quickrun Setting
silent! nmap <unique> <C-r> <Plug>(quickrun)
let g:loaded_quicklaunch = 1
let g:quickrun_config = {
  \ '*': {
  \ 'split': '{"rightbelow 10sp"}'
  \ }
\}

"Insert Signature
function! InsertSignature()
  let filename = expand('%')
  let date = strftime("%Y/%m/%d")
  let user = $USER
  call append(1, '#')
  call append(2, printf('# %s', filename))
  call append(3, printf('# created by %s on %s', user, date))
  call append(4, '#')
  call cursor('$', 0)
endfunction
autocmd BufNewFile * call InsertSignature()
