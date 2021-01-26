syntax on
colo allhallowseve
hi diffAdded   ctermbg=NONE ctermfg=46  cterm=NONE guibg=NONE guifg=#00FF00 gui=NONE
hi diffRemoved ctermbg=NONE ctermfg=196 cterm=NONE guibg=NONE guifg=#FF0000 gui=NONE
hi link diffLine String
hi link diffSubname Normal
set expandtab
set hlsearch
set incsearch
let mapleader = " "
nmap <silent> <leader>n :set nu! rnu!<CR>
nmap <silent> <leader>r :set rnu!<CR>
nmap <silent> <leader>s :w<CR>
nmap <silent> <leader>q :q<CR>
autocmd Filetype markdown setlocal spell textwidth=120 " Automatic wrapping

" git
autocmd Filetype gitcommit setlocal spell textwidth=72 " Automatic git commit wrapping
