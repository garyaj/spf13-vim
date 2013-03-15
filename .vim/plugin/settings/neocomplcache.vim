" neocomplcache {
    " A better autocomplete system!
    let g:acp_enableAtStartup = 0
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_smart_case = 1
    let g:neocomplcache_enable_underbar_completion = 1
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_enable_auto_delimiter = 1
    let g:neocomplcache_max_list = 15
    let g:neocomplcache_auto_completion_start_length = 3
    let g:neocomplcache_force_overwrite_completefunc = 1
    let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'

    " Enable neosnippet snipmate compatibility mode
    let g:neosnippet#enable_snipmate_compatibility = 1


    " AutoComplPop like behavior.
    let g:neocomplcache_enable_auto_select = 0

    " Map standard Ctrl-N completion to Cmd-Space
    inoremap <D-Space> <C-n>

    " SuperTab like snippets behavior.
    imap  <silent><expr><TAB>  neosnippet#expandable() ?
                \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
                \ "\<C-e>" : "\<TAB>")
    smap  <TAB>  <Right><Plug>(neosnippet_jump_or_expand) 

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
      let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    " Ctrl-k expands snippet & moves to next position
    " <CR> chooses highlighted value
    imap <C-k>     <Plug>(neosnippet_jump_or_expand)
    smap <C-k>     <Plug>(neosnippet_jump_or_expand)
    inoremap <expr><C-g>   neocomplcache#undo_completion()
    inoremap <expr><C-l>   neocomplcache#complete_common_string()
    inoremap <expr><CR>    neocomplcache#complete_common_string()

    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><s-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"

    " <CR>: close popup
    " <s-CR>: close popup and save indent.
    inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup()"\<CR>" : "\<CR>"
    inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"

    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplcache#close_popup()

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_omni_patterns')
        let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
    let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

    " For snippet_complete marker.
    if has('conceal')
        set conceallevel=2 concealcursor=i
    endif

" }

