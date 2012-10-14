let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.(git|hg|svn)$',
    \ 'file': '\.(exe|so|dll)$' }

let g:ctrlp_working_path_mode = 2

" Default to filename searches - so that appctrl will find application
" controller
let g:ctrlp_by_filename = 1

" We don't want to use Ctrl-p as the mapping because
" it interferes with YankRing (paste, then hit ctrl-p)
let g:ctrlp_map = ',t'
