" Pathogen package manager
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

" Show commands while typing them
set showcmd

" Enable mouse support
set mouse=a

" Set GUI stuff
if has("gui_running")
    set guifont=DejaVu\ Sans\ Mono\ 10
    colorscheme tango-morning
    " Remove toolbar and tearoff thingies
    set guioptions-=T
    set guioptions-=t
endif

" Convert tabs to spaces
set expandtab
set smarttab

" Insert a real tab with Shift-Tab
inoremap <S-Tab> <C-V><Tab>

" Gundo
nnoremap <F5> :GundoToggle<CR>

" Sane indents
set tabstop=4
set shiftwidth=4

" Fancy search
set incsearch
set hlsearch

" Enable filetype detection and fancy indentation
filetype plugin indent on

" Custom indentation settings
autocmd FileType html setlocal shiftwidth=2
autocmd FileType xml setlocal shiftwidth=2
autocmd FileType css setlocal shiftwidth=2
autocmd FileType make setlocal noexpandtab

" Map surround '~' to double-backticks; useful in reStructuredText
autocmd FileType python let b:surround_126 = "``\r``"
autocmd FileType rst let b:surround_126 = "``\r``"

" Banner style C
set cinoptions=}1s,t0

" Paste mode: Disable autoindent when pasting from an external source
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Ignore insignificant files
set wildignore+=*.o,*.obj,*.a,lib*
set wildignore+=*.hi,cabal-dev,dist
set wildignore+=*.class,*.jar,target
set wildignore+=*.pyc,*.pyo,__pycache__
set wildignore+=.hg,.git

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

" Set up printing
set printexpr=PrintFile(v:fname_in)
set printfont=DejaVu\ Sans\ Mono\ 10
function PrintFile(fname)
    call system("evince " . a:fname)
    call delete(a:fname)
    return v:shell_error
endfunc
