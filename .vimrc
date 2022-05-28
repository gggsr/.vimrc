set nocompatible
set backspace=2
set shiftwidth=4
set tabstop=4
set softtabstop=4
set nu
set relativenumber
set showmode
set showcmd
set autochdir
set smarttab
set smartindent
set autoindent
set cindent
set nobackup
set ruler
set cul
set culopt=number
set noswapfile
set nowritebackup
set ttimeoutlen=0
set timeoutlen=1000
set bg=dark
set laststatus=2

call plug#begin('~/.vim/autoload/')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/tagbar'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
call plug#end()

colorscheme onedark

autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeMinimalUI=1
let g:NERDTreeShowHidden=0
let g:webdevicons_enable_nerdtree=1
let g:webdevicons_conceal_nerdtree_brackets=1
let g:lightline = {
        \ 'component_function': {
        \   'filetype': 'MyFiletype',
        \   'fileformat': 'MyFileformat',
        \ }
        \ }

  function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
  endfunction

  function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
  endfunction

if !has('gui_running')
	set t_co=256
endif

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
	  let col = col('.') - 1
	    return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_compact=1
let g:tagbar_indent=1
let g:tagbar_show_data_type=1
let g:tagbar_show_tag_linenumbers=2
let g:tagbar_show_tag_count=1
let g:tagbar_autoshowtag=1
let g:tagbar_wrap=2
let g:tagbar_width=30
let g:tagbar_autofocus=1
nnoremap <leader>1 :TagbarToggle<cr>
