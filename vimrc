" === PRELIMINARIES ====================================================

" Load all the things
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

" Set GUI stuff
if has("gui_running")
    set guifont=DejaVu\ Sans\ Mono\ 10
    colorscheme solarized
    " Remove toolbar and tearoff thingies
    set guioptions-=T
    set guioptions-=t
endif

" Convert tabs to spaces
set expandtab
set smarttab

" Sane indents
set tabstop=4
set shiftwidth=4

" Word wrap yay
set wrap
set linebreak

" Fancy search
set incsearch
set hlsearch

" Show commands while typing them
set showcmd

" Enable mouse support
set mouse=a


" === KEY BINDINGS =====================================================

" Insert a real tab with <S-Tab>
inoremap <S-Tab> <C-V><Tab>

" Press <Q> to wrap current paragraph
nnoremap <silent> Q gwip

" Paste mode: Disable autoindent when pasting from an external source
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Open Gundo
nnoremap <F5> :GundoToggle<CR>

" Open CtrlP
nnoremap <Leader>t :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>

" Line numbers!
nnoremap <Leader>l :setlocal number!<CR>

" Disable search highlighting
nnoremap <Leader>q :nohlsearch<CR>


" === INDENTATION AND SYNTAX ===========================================

" Enable filetype detection and fancy indentation
filetype plugin indent on

" Custom indentation settings
autocmd FileType html setlocal shiftwidth=2
autocmd FileType xml setlocal shiftwidth=2
autocmd FileType css setlocal shiftwidth=2
autocmd FileType javascript setlocal shiftwidth=2
autocmd FileType make setlocal noexpandtab
autocmd FileType gitconfig setlocal noexpandtab

" Map surround '~' to double-backticks; useful in reStructuredText
autocmd FileType python let b:surround_126 = "``\r``"
autocmd FileType rst let b:surround_126 = "``\r``"

" Banner style C
set cinoptions=}1s,t0


" === FILENAMES AND PATHS ==============================================

" Ignore insignificant files
set wildignore+=*.o,*.obj,*.a,*.so
set wildignore+=*.hi,cabal-dev,dist
set wildignore+=*.class,*.jar,target
set wildignore+=*.pyc,*.pyo,__pycache__
set wildignore+=.hg,.git,_darcs
set wildignore+=build,lib

" Allow :cd to a directory in ~/dev
set cdpath+=~/dev

" Set backup and swap directories
let backupdir = $HOME . '/.local/share/vim/backup'
let directory = $HOME . '/.local/share/vim/swap'
if exists('*mkdir')
    if !isdirectory(backupdir)
        call mkdir(backupdir, 'p', 0700)
    endif
    if !isdirectory(directory)
        call mkdir(directory, 'p', 0700)
    endif
endif
let &backupdir = backupdir
let &directory = directory


" === MISCELLANY =======================================================

" Set up printing
set printexpr=PrintFile(v:fname_in)
set printfont=DejaVu\ Sans\ Mono\ 10
function PrintFile(fname)
    call system("evince " . a:fname)
    call delete(a:fname)
    return v:shell_error
endfunc

" CtrlP custom status line
let g:ctrlp_status_func = {
            \ 'main': 'CtrlP_StatusMain',
            \ 'prog': 'CtrlP_StatusProg',
            \ }

function! CtrlP_StatusMain(...)
    return '%=%< %{getcwd()} %*'
endfunction

function! CtrlP_StatusProg(str)
    return str
endfunction
