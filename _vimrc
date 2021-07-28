syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set incsearch
" set colorcolumn=80
set number
set clipboard=unnamed " set relativenumber off
set noundofile " Does not save an undo file copy after saving a file
set nobackup nowritebackup
set backupdir=C:\Users\Xavie\OneDrive\Desktop\LC\backup
" set directory
set noswapfile 

highlight ColorColumn ctermbg=0 guibg=lightgrey

let mapleader=","
" Mapping to reload configuration
nmap <leader>so :source C:\Users\Xavie\_vimrc<CR>

if has("gui_running")
  if has("gui_gtk2")
    " set guifont=Inconsolata\ 12
	set guifont=Roboto\ Mono\ Regular:h10
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    " set guifont=Consolas:h11:cANSI
	set guifont=Roboto\ Mono\ Regular:h10
	" let g:airline_powerline_fonts                                 = 1
	" let g:airline_theme="dark"
	set guioptions-=m  "menu bar
	set guioptions-=T  "toolbar
	set guioptions-=r  "scrollbar
  endif
endif

set pythonthreehome=C:\Python36-32\
set pythonthreedll=C:\Python36-32\python36.dll
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
map <silent> <F5> :call gruvbox#bg_toggle()<CR>
imap <silent> <F5> <ESC>:call gruvbox#bg_toggle()<CR>a
vmap <silent> <F5> <ESC>:call gruvbox#bg_toggle()<CR>gv

source $VIMRUNTIME/vimrc_example.vim

au GUIEnter * simalt ~x
set hls
set is
set cb=unnamed
set gfn=Fixedsys:h10
set ts=4
set sw=4
set si

inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}

autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++14 % -o %:r -Wl,--stack,268435456<CR>
autocmd filetype cpp nnoremap <F10> :!%:r<CR>
autocmd filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $

set nu
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set rnu
    autocmd BufLeave,FocusLost,InsertEnter * set nornu
augroup END

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Base 16 themes by Chris Kempson
Plug 'chriskempson/base16-vim'

" Gruvbox vim theme
Plug 'morhetz/gruvbox'

" Note taking plug-in for vim
" Plug 'xolox/vim-notes'

" Another note taking plugin: vim Wiki
Plug 'vimwiki/vimwiki'

" Powerline plugin
Plug 'powerline/powerline'

" Initialize plugin system
call plug#end()

