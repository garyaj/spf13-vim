" GUI Settings {
    " GVIM- (here instead of .gvimrc)
    if has('gui_running')
        " Show tab number (useful for Cmd-1, Cmd-2.. mapping)
        " For some reason this doesn't work as a regular set command,
        " (the numbers don't show up) so I made it a VimEnter event
        autocmd VimEnter * set guitablabel=%N:\ %t\ %M

        set columns=106
        set lines=55                " 55 lines of text instead of 24,
        set guioptions-=T           " remove the toolbar
        set guioptions-=l           " remove the left hand scrollbar
        set guioptions-=L           " remove the left hand scrollbar
        set guioptions-=r           " remove the right hand scrollbar
        set guioptions-=R           " remove the right hand scrollbar

        highlight SpellBad term=underline gui=undercurl guisp=Orange
        highlight ColorColumn guibg=#232728

        " Use a line-drawing char for pretty vertical splits.
        set fillchars+=vert:│

        if has("gui_gtk2")
            " set guifont=Andale\ Mono\ Regular\ 16,Menlo\ Regular\ 15,Consolas\ Regular\ 16,Courier\ New\ Regular\ 18
            set guifont=Source\ Code\ Pro\ 20,Inconsolata\ 20,Monaco\ 17
        else
            " set guifont=Andale\ Mono\ Regular:h16,Menlo\ Regular:h15,Consolas\ Regular:h16,Courier\ New\ Regular:h18
            set guifont=Source\ Code\ Pro:h20,Inconsolata:h20,Monaco:h17
        endif
        if has('gui_macvim')
            set transparency=5          " Make the window slightly transparent
        endif

        " Different cursors for different modes.
        set guicursor=n-c:block-Cursor-blinkon0
        set guicursor+=v:block-vCursor-blinkon0
    else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256                 " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
        "set term=builtin_ansi       " Make arrow and other keys work
    endif
" }

