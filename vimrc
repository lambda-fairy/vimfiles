" Pathogen package manager
runtime bundle/vim-pathogen/autoload/pathogen.vim

" Show commands while typing them
set showcmd

" Enable mouse support
set mouse=a

" Set GUI font to DejaVu Sans Mono
if has("gui_gtk2")
    set guifont=DejaVu\ Sans\ Mono\ 10
endif

" Convert tabs to spaces
set expandtab
set smarttab

" Insert a real tab with Shift-Tab
inoremap <S-Tab> <C-V><Tab>

" Sane indents
set tabstop=4
set shiftwidth=4

" Fancy search
set incsearch
set hlsearch

" Enable indentation support
filetype plugin indent on

" Custom indentation settings
autocmd FileType html setlocal shiftwidth=2
autocmd FileType xml setlocal shiftwidth=2
autocmd FileType css setlocal shiftwidth=2
autocmd FileType make setlocal noexpandtab

" Banner style C
set cinoptions=}1s,t0

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Paste mode: Disable autoindent when pasting from an external source
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

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
