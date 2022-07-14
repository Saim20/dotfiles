" Plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/site/plugged')

" Declare the list of plugins.
Plug 'vim-airline/vim-airline'

" Visual Settings
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Color theme plugins
Plug 'joshdick/onedark.vim'

" Github Copilot
Plug 'github/copilot.vim'

" Snippets
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""
" Color Settings
"""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

colorscheme onedark

"""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Settings
"""""""""""""""""""""""""""""""""""""""""""""""""
" For Goyo
" let g:goyo_width=50

" For LimeLight
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
" highlight line
let g:limelight_bop = '^.*$'
" let g:limelight_eop = '\n'
let g:limelight_paragraph_span = 0

" To make completion works like VSCode
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'


"""""""""""""""""""""""""""""""""""""""""""""""""
" UI Settings
"""""""""""""""""""""""""""""""""""""""""""""""""
" Keep cursor in the middle of the page, useful for editing text
set so=999
" Turn limelight on by default
" autocmd VimEnter * Limelight
" Turn Goyo on by default
" autocmd VimEnter * Goyo
" autocmd VimEnter * AirlineToggle
" In Goyo, if airline is turned on, do nto show scratch area
" autocmd! User GoyoEnter nested set eventignore=FocusGained
" autocmd! User GoyoLeave nested set eventignore=

" Line numbers
set number

" Show line numbers in the left margin
set numberwidth=2

set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set mouse=a

