" Initialize Pathogen
call pathogen#infect()
call pathogen#helptags()

" vim-plug installation
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl --insecure -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"Plug 'junegunn/seoul256.vim'
"Plug 'junegunn/goyo.vim'
"Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-fugitive'
call plug#end()

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

" Remove comments when joining lines
set formatoptions+=j

" make backspace work in /// environment
set backspace=indent,start,eol

" Remember undo history when switching buffers
set hid

"colorscheme peachpuff
set t_Co=256
colorscheme xoria256

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
map <Leader>c :w\|:bd<CR>
map <M-Left> :bp<CR>
map <M-Right> :bn<CR>
map <Leader>l :ls<CR>
map <Leader><Leader> :b#<CR>
map <Leader>fs :FSHere<CR>
map <Leader>tb :TagbarToggle<CR>


" Statusline
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]
:set laststatus=2

" Show the current command in the lower right corner
set showcmd

" cd to the directory containing the file in the buffer
nmap <silent> <Leader>cd :lcd %:h<CR>

" FSwitch mappings
nmap <silent> <Leader>fs :FSHere<CR>
map <C-Tab> :FSHere<CR>
augroup fswithsettings
    au!
    au BufEnter *.hpp let b:fswitchdst = "cpp" | let b:fswitchlocs = "reg:/include/src/,reg:/include.*/src/,ifrel:|/include/|../src|"
    au BufEnter *.cpp let b:fswitchdst = "hpp,h"
    au BufEnter *.hh let b:fswitchdst = "cc" | let b:fswitchlocs = "reg:/include/src/,reg:/include.*/src/,ifrel:|/include/|../src|"
    au BufEnter *.cc let b:fswitchdst = "hh,h" | let b:fswitchlocs = "reg:/src/include/,reg:/src.*/include/,ifrel:|/src/|../include|"
augroup END

"" textwith when committing in git
au FileType gitcommit set tw=72

" NerdTree mappings
nmap <silent> <Leader>t :NERDTreeToggle<CR>
nmap <silent> <Leader>tf :NERDTreeFind<CR>
let NERDTreeDirArrows=1
let NERDTreeQuitOnOpen=1

" buftab settings
let g:buftabs_separator=":"

" Set directory for swp files
set directory=/tmp
set backupdir=/tmp


" Do OSX special stuff
let s:uname = system("echo -n \"$(uname)\"")
if !v:shell_error && s:uname != "Linux"
    colorscheme xoria256
endif

" Single line comments in go code as default
let g:NERDCustomDelimiters = {
    \ 'go': {  'left': '//', 'leftAlt': '/*','rightAlt': '*/' },
    \}
let NERD_go_alt_style=1
let g:go_fmt_command = "goimports"

" Automatic reload of files if content is modified on disk
set autoread

" Syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" gotags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

" NeoComplete settings
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Recommended neocomplete key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
" For no inserting <CR> key.
" return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

so $HOME/.fzf/plugin/fzf.vim
