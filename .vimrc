" Modeline and Notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
"                    __ _ _____              _
"         ___ _ __  / _/ |___ /      __   __(_)_ __ ___
"        / __| '_ \| |_| | |_ \ _____\ \ / /| | '_ ` _ \
"        \__ \ |_) |  _| |___) |_____|\ V / | | | | | | |
"        |___/ .__/|_| |_|____/        \_/  |_|_| |_| |_|
"            |_|
"
"   This is the personal .vimrc file of Steve Francia.
"   While much of it is beneficial for general use, I would
"   recommend picking out the parts you want and understand.
"
"   You can find me at http://spf13.com
" }

" Environment {
    " Basics {
        set nocompatible        " must be first line
        set background=dark     " Assume a dark background
        if has ("unix") && "Darwin" != system("echo -n \"$(uname)\"")
          " on Linux use + register for copy-paste
          set clipboard=unnamedplus
        else
          " one mac and windows, use * register for copy-paste
          set clipboard=unnamed
        endif
    " }

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if has('win32') || has('win64')
          set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }
    "
    " Setup Bundle Support {
    " The next three lines ensure that the ~/.vim/bundle/ system works
        filetype off
        set rtp+=~/.vim/bundle/vundle
        call vundle#rc()
    " }

" }

" Bundles {
    " Use local bundles if available {
        if filereadable(expand("~/.vimrc.bundles.local"))
            source ~/.vimrc.bundles.local
        endif
    " }
    " Use fork bundles if available {
        if filereadable(expand("~/.vimrc.bundles.fork"))
            source ~/.vimrc.bundles.fork
        endif
    " }
    " Use bundles config {
        if filereadable(expand("~/.vimrc.bundles"))
            source ~/.vimrc.bundles
        endif
    " }
" }

" General {
    set background=dark         " Assume a dark background
    if !has('gui')
        "set term=$TERM          " Make arrow and other keys work
    endif
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " syntax highlighting
    " set mouse=a                 " automatically enable mouse usage
    set encoding=utf-8

    " Most prefer to automatically switch to the current file directory when
    " a new buffer is opened; to prevent this behavior, add
    " let g:spf13_no_autochdir = 1 to your .vimrc.bundles.local file
    if !exists('g:spf13_no_autochdir')
        autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
        " always switch to the current file directory.
    endif

    " set autowrite                  " automatically write a file when leaving a modified buffer
    set autoread                    "Reload files changed outside vim
    set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
    set virtualedit=onemore         " allow for cursor beyond last character
    set history=1000                " Store a ton of history (default is 20)
    set spell                       " spell checking on
    set hidden                      " allow buffer switching without saving

    set backspace=indent,eol,start  " backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set number                      " Line numbers on
    set relativenumber              " Line numbers relative to cursor

    " Setting up the directories {
        set backup                      " backups are nice ...
        if has('persistent_undo')
            set undofile                "so is persistent undo ...
            set undolevels=1000         "maximum number of changes that can be undone
            set undoreload=10000        "maximum number lines to save for undo on a buffer reload
        endif

    " To disable views set
    " g:spf13_no_views = 1
    " in your .vimrc.bundles.local file"
    if !exists('g:spf13_no_views')
        " Could use * rather than *.*, but I prefer to leave .files unsaved
        au BufWinLeave *.* silent! mkview  "make vim save view (state) (folds, cursor, etc)
        au BufWinEnter *.* silent! loadview "make vim load view (state) (folds, cursor, etc)
    endif
    " }
" }

" Vim UI {
    if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        let g:solarized_termcolors=256
        color solarized                 " load a colorscheme
        let g:solarized_termtrans=1
        let g:solarized_contrast="high"
        let g:solarized_visibility="high"
    endif
    set tabpagemax=15               " only show 15 tabs
    set showmode                    " display the current mode

    set cursorline                  " highlight current line

    " if has('cmdline_info')
    "     set ruler                   " show the ruler
    "     set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    "     set showcmd                 " show partial commands in status line and
    "                                 " selected characters/lines in visual mode
    " endif

    if has('statusline')
        set laststatus=2

    "     " Broken down into easily includeable segments
    "     set statusline=%<%f\    " Filename
    "     set statusline+=%w%h%m%r " Options
    "     set statusline+=%{fugitive#statusline()} "  Git Hotness
    "     set statusline+=\ [%{&ff}/%Y]            " filetype
    "     set statusline+=\ [%{getcwd()}]          " current dir
    "     set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    endif
" }

" Search Settings {
    set showmatch                   " show matching brackets/parenthesis
    set incsearch                   " find as you type search
    set hlsearch                    " highlight search terms
    set viminfo='100,f1             " Save up to 100 marks, enable capital marks
    set winminheight=0              " windows can be 0 line high
    set ignorecase                  " case insensitive search
    set smartcase                   " case sensitive when uc present
    set gdefault                    " global substitutes by default
    set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
" }

" Scrolling {

    set scrolloff=3                 " Start scrolling when we're 3 lines away from margins
    set scrolljump=5                " lines to scroll when cursor leaves screen
    set sidescrolloff=15
    set sidescroll=1

    set foldenable                  " auto fold code
    set list listchars=tab:\ \ ,trail:·,extends:#,nbsp:. " Highlight problematic whitespace
" }

" Completion {

    set wildmenu                    " show list instead of just completing
    set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
    set wildignore=*.o,*.obj,*~,*.exe,*.dll,*.manifest "stuff to ignore when tab completing
    set wildignore+=*vim/backups*
    set wildignore+=*sass-cache*
    set wildignore+=.hg,.git,.svn                    " Version control
    set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
    set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
    set wildignore+=*.spl                            " compiled spelling word lists
    set wildignore+=*.sw?                            " Vim swap files
    set wildignore+=*DS_Store*
    set wildignore+=vendor/rails/**
    set wildignore+=vendor/cache/**
    set wildignore+=*.gem
    set wildignore+=log/**
    set wildignore+=tmp/**

" }

" Formatting {
    set nowrap                      " Don't wrap long lines
    set textwidth=80
    set formatoptions=qrn1
    set colorcolumn=+1
    set autoindent                  " indent at the same level of the previous line
    set shiftwidth=2                " use indents of 4 spaces
    set expandtab                   " tabs are spaces, not tabs
    set tabstop=2                   " an indentation every four columns
    set softtabstop=2               " let backspace delete indent
    "set matchpairs+=<:>                " match, to be used with %
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
    "set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
    " Remove trailing whitespaces and ^M chars
    autocmd FileType c,cpp,java,php,javascript,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
    autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
" }

" Plugins {

    " PIV {
        " let g:DisableAutoPHPFolding = 0
        " let g:PIVAutoClose = 0
    " }

    " Misc {
        let g:NERDShutUp=1
        let b:match_ignorecase = 1
    " }

    " AutoCloseTag {
        " Make it so AutoCloseTag works for xml and xhtml files as well
        au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
        nmap <Leader>ac <Plug>ToggleAutoCloseMappings
    " }

    " SnipMate {
        " Setting the author var
        " If forking, please overwrite in your .vimrc.local file
        let g:snips_author = 'Steve Francia <steve.francia@gmail.com>'
    " }

     " Session List {
        set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
        nmap <leader>sl :SessionList<CR>
        nmap <leader>ss :SessionSave<CR>
     " }

     " PythonMode {
     " Disable if python support not present
        if !has('python')
           let g:pymode = 1
        endif
     " }

     " indent_guides {
        if !exists('g:spf13_no_indent_guides_autocolor')
            let g:indent_guides_auto_colors = 1
        else
            " for some colorscheme ,autocolor will not work,like 'desert','ir_black'.
            autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#212121   ctermbg=3
            autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#404040 ctermbg=4
        endif
        " set ts=4 sw=4 et
        let g:indent_guides_start_level = 2
        let g:indent_guides_guide_size = 1
        let g:indent_guides_enable_on_vim_startup = 1
     " }

" }

 " Functions {

function! InitializeDirectories()
    let separator = "."
    let parent = $HOME
    let prefix = '.vim'
    let dir_list = {
                \ 'backup': 'backupdir',
                \ 'views': 'viewdir',
                \ 'swap': 'directory' }

    if has('persistent_undo')
        let dir_list['undo'] = 'undodir'
    endif

    for [dirname, settingname] in items(dir_list)
        let directory = parent . '/' . prefix . dirname . "/"
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory)
            endif
        endif
        if !isdirectory(directory)
            echo "Warning: Unable to create backup directory: " . directory
            echo "Try: mkdir -p " . directory
        else
            let directory = substitute(directory, " ", "\\\\ ", "g")
            exec "set " . settingname . "=" . directory
        endif
    endfor
endfunction
call InitializeDirectories()

function! NERDTreeInitAsNeeded()
    redir => bufoutput
    buffers!
    redir END
    let idx = stridx(bufoutput, "NERD_tree")
    if idx > -1
        NERDTreeMirror
        NERDTreeFind
        wincmd l
    endif
endfunction
" }

" Use fork vimrc if available {
    if filereadable(expand("~/.vimrc.fork"))
        source ~/.vimrc.fork
    endif
" }
" Use local vimrc if available {
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
" }

" Use local gvimrc if available and gui is running {
    if has('gui_running')
        if filereadable(expand("~/.gvimrc.local"))
            source ~/.gvimrc.local
        endif
    endif
" }
