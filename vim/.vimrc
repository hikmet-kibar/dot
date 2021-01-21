""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               plugins                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Automatic installation of vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  echom "Don't forget to :GoInstallBinaries if you're doing Go dev."
endif

" flying
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'vimwiki/vimwiki'

" go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'stamblerre/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'sheerun/vim-polyglot'

" misc
Plug 'lervag/vimtex'  " TODO: Use pandoc instead
Plug 'arcticicestudio/nord-vim'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               settings                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
filetype on
filetype plugin on
filetype indent on
set nonumber
set norelativenumber
set nocompatible
set icon
set showmode
set showmatch
set history=100
set autowrite           " autosave when changing
set hidden              " when switching buffers
set cmdheight=1         " avoid HitEnter prompts
set shortmess=aoOtIF    " avoid HitEnter prompts
set nobackup            " more risky, but cleaner
set noswapfile
set nowritebackup
set ttyfast             " faster scrolling
set nofixendofline      " prevent silent fixing by vim
set incsearch           " highlight search while typing
set hlsearch

set noruler
set laststatus=2
set statusline=
set statusline+=%*\ %<%.60F%*                 " path, trunc to 80 length
set statusline+=\ [%{strlen(&ft)?&ft:'none'}] " filetype
set statusline+=%*\ %l:%c%*                   " current line and column
set statusline+=%*\ %p%%%*                    " percentage

set tabstop=2
set shiftwidth=2
set smarttab
set smartindent
set autoindent
set expandtab       " replace tabs with spaces
set softtabstop=2
set textwidth=72
set wildmenu        " Better command search
set wildignorecase

let g:vimwiki_auto_header = 0
let g:vimwiki_listsyms = ' .oOX'
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_dir_link = 'README'
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'index': 'README',
                      \ 'diary_index': 'README',
                      \ 'diary_header': 'Journal',
                      \ 'auto_toc': 0,
                      \ 'auto_diary_index': 1,
                      \ 'links_space_char': '-',
                      \ 'syntax': 'markdown',
                      \ 'ext': '.md'}]


if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
colorscheme nord
hi Conceal ctermbg=none

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        functions & autocommands                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup MY_AUTOCMDS
  autocmd BufNewFile ~/vimwiki/diary/[0-9]*.md :.!journaling %
  autocmd BufWritePre ~/vimwiki/pipelines/reviews/README.md :1,$d | .!reviews %

  autocmd BufNewFile,BufRead *.md set filetype=markdown
  autocmd BufNewFile,BufRead *.{yaml,yml} set filetype=yaml

  autocmd BufWritePre * :call TrimWhitespace()
  autocmd CompleteDone * silent! pclose!
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               mappings                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ' '
nnoremap <silent> <leader><cr> :noh<cr>:redraw!<cr>

" yank like D or C
noremap Y y$

" Stay in visual mode
vnoremap < <gv
vnoremap > >gv

" Better page down and page up
noremap <C-j> <C-d>
noremap <C-k> <C-b>

" Search word under cursor
" Based on Go cli command at
" https://github.com/hikmet-kibar/scripts/cmd/searchweb
nnoremap <silent> <leader>d :exec "!searchweb -page=duck -config=${PAGES} "
                              \ . expand("<cword>")<cr> :redraw!<cr>
nnoremap <silent> <leader>o :exec "!searchweb -page=ordnet -config=${PAGES} "
                              \ . expand("<cword>")<cr> :redraw!<cr>
nnoremap <silent> <leader>k :exec "!searchweb -page=korpus -config=${PAGES} "
                              \ . expand("<cword>")<cr> :redraw!<cr>
nnoremap <silent> <leader>t :exec "!searchweb -page=tysk -config=${PAGES} "
                              \ . expand("<cword>")<cr> :redraw!<cr>

" fzf
nnoremap <C-f> :Files<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-l> :Lines<CR>

