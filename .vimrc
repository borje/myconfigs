set tabpagemax=15
set foldmethod=indent
set hlsearch " highlight search
set number " show linenumbers
set autoindent " automatic indentation
colorscheme ir_black
" tab complete like in bash
set wildmenu
set wildmode=longest,list,full
set incsearch

syntax on
filetype plugin on

" Map <C-Space> to omnicompletion
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>
