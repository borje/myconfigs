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

" Remember undo history when switching buffers
set hid

colorscheme peachpuff
" tab complete like in bash
set wildmenu
set wildmode=longest,list,full
set incsearch
set nowrap
set showcmd

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
map <Leader>c :w\|:bd<CR>
map <M-Left> :bp<CR>
map <M-Right> :bn<CR>
map <Leader>l :ls<CR>
map <Leader><Leader> :b#<CR>


" Statusline
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]
:set laststatus=2

" Show the current command in the lower right corner
set showcmd

" cd to the directory containing the file in the buffer
nmap <silent> <Leader>cd :lcd %:h<CR>

" set default SuperTab completion mode
let g:SuperTabDefaultCompletionType = "context"

" FSwitch mappings
nmap <silent> <Leader>fs :FSHere<CR>
map <C-Tab> :FSHere<CR>

" NerdTree mappings
nmap <silent> <Leader>t :NERDTreeToggle<CR>
let NERDTreeDirArrows=1
let NERDTreeQuitOnOpen=1

" buftab settings
let g:buftabs_separator=":"

" Set directory for swp files
set directory=/tmp
set backupdir=/tmp
