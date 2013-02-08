" Initialize Pathogen
call pathogen#infect()
call pathogen#helptags()

set tabpagemax=15
set foldmethod=indent
set foldlevelstart=99
set hlsearch " highlight search
set number " show linenumbers
set ruler
set scrolloff=8
let mapleader = ","
" Indentation 
set expandtab
set autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=8
set ignorecase
set smartcase

colorscheme peachpuff
" tab complete like in bash
set wildmenu
set wildmode=longest,list,full
set incsearch
set nowrap

syntax on
filetype plugin on
filetype indent on

" Map <C-Space> to omnicompletion
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

"" key bindings
map ,c :w\|:bd<CR>
map <M-Left> :bp<CR>
map <M-Right> :bn<CR>
map ,l :ls<CR>
map ,, :b#<CR>
map ,fs :FSHere<CR>


" Statusline
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]
:set laststatus=2

" Show the current command in the lower right corner
set showcmd

" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>

" set default SuperTab completion mode
let g:SuperTabDefaultCompletionType = "context"

" FSwitch mappings
nmap <silent> ,fs :FSHere<CR>
augroup fswithsettings
    au!
    au BufEnter *.hpp let b:fswitchdst = "cpp" | let b:fswitchlocs = "reg:/include/src/,reg:/include.*/src/,ifrel:|/include/|../src|"
    au BufEnter *.cpp let b:fswitchdst = "hpp,h"
augroup END

" NerdTree mappings
nmap <silent> <F7> :NERDTreeToggle<CR>
