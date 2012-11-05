" vim: set foldmarker={{{,}}} foldlevel=0 foldmethod=marker spell:
" Arpeggio lets us define key-chord combos (simultaneous key presses)
call arpeggio#load()

" General vim sanity improvements {{{

"The default leader is '\', but many people prefer ',' as it's in a standard
"location. To override this behavior and set it back to '\' (or any other
"character) add let g:spf13_leader='\' in your .vimrc.bundles.local file
if !exists('g:spf13_leader')
    let mapleader = ','
else
    let mapleader=g:spf13_leader
endif


" alias yw to yank the entire word 'yank inner word'
" even if the cursor is halfway inside the word
" FIXME: will not properly repeat when you use a dot (tie into repeat.vim)
nnoremap ,yw yiww

" ,ow = 'overwrite word', replace a word with what's in the yank buffer
" FIXME: will not properly repeat when you use a dot (tie into repeat.vim)
nnoremap ,ow "_diwhp

"make Y consistent with C and D (I'm not convinced)
" nnoremap Y y$
" }}}

" RSI Prevention - keyboard remaps {{{
" Certain things we do every day as programmers stress
" out our hands. For example, typing underscores and
" dashes are very common, and in position that require
" a lot of hand movement. Vim to the rescue
"
" Now using the middle finger of either hand you can type
" underscores with apple-k or apple-d, and add Shift
" to type dashes
imap <silent> <D-k> _
imap <silent> <D-d> _
imap <silent> <D-K> -
imap <silent> <D-D> -

" ,# Surround a word with #{ruby interpolation}
map ,# ysiw#
vmap ,# c#{<C-R>"}<ESC>

" ," Surround a word with "quotes"
map ," ysiw"
vmap ," c"<C-R>""<ESC>

" ,' Surround a word with 'single quotes'
map ,' ysiw'
vmap ,' c'<C-R>"'<ESC>

" ,) or ,( Surround a word with (parens)
" The difference is in whether a space is put in
map ,( ysiw(
map ,) ysiw)
vmap ,( c( <C-R>" )<ESC>
vmap ,) c(<C-R>")<ESC>

" ,[ Surround a word with [brackets]
map ,] ysiw]
map ,[ ysiw[
vmap ,[ c[ <C-R>" ]<ESC>
vmap ,] c[<C-R>"]<ESC>

" ,{ Surround a word with {braces}
map ,} ysiw}
map ,{ ysiw{
vmap ,} c{ <C-R>" }<ESC>
vmap ,{ c{<C-R>"}<ESC>

" gary bernhardt's hashrocket
imap <c-l> <space>=><space>

" Change inside various enclosures with Cmd-" and Cmd-'
" The f makes it find the enclosure so you don't have
" to be standing inside it
nnoremap <D-'> f'ci'
nnoremap <D-"> f"ci"
nnoremap <D-(> f(ci(
nnoremap <D-)> f)ci)
nnoremap <D-[> f[ci[
nnoremap <D-]> f]ci]

"Go to last edit location with ,.
nnoremap ,. '.

"When typing a string, your quotes auto complete. Move past the quote
"while still in insert mode by hitting Ctrl-a. Example:
"
" type 'foo<c-a>
"
" the first quote will autoclose so you'll get 'foo' and hitting <c-a> will
" put the cursor right after the quote
imap <C-a> <esc>wa
" }}}

" NERD tree {{{
" Cmd-Shift-N for nerd tree
nmap <D-N> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
" Open the project tree and expose current file in the nerdtree with Ctrl-\
nnoremap <silent> <C-\> :NERDTreeFind<CR>:vertical res 30<CR>
" }}}

" ,q to toggle quickfix window (where you have stuff like GitGrep)
" ,oq to open it back up (rare)
" nmap <silent> ,qc :CloseSingleConque<CR>:cclose<CR>
nmap <silent> ,qc :cclose<CR>
nmap <silent> ,qo :copen<CR>

" move up/down quickly by using Cmd-j, Cmd-k
" which will move us around by functions
nnoremap <silent> <D-j> }
nnoremap <silent> <D-k> {
autocmd FileType ruby map <buffer> <D-j> ]m
autocmd FileType ruby map <buffer> <D-k> [m
autocmd FileType rspec map <buffer> <D-j> }
autocmd FileType rspec map <buffer> <D-k> {

" Command-/ to toggle comments
map <D-/> :TComment<CR>
imap <D-/> <Esc>:TComment<CR>i

" GitGrep {{{
"open up a git grep line, with a quote started for the search
nnoremap ,gg :GitGrep ""<left>
"GitGrep Current Partial
nnoremap ,gcp :GitGrepCurrentPartial<CR>
"GitGrep Current File
nnoremap ,gcf :call GitGrep(expand("%:t:r"))<CR>
" }}}

"Move back and forth through previous and next buffers
"with ,z and ,x
nnoremap <silent> ,z :bp<CR>
nnoremap <silent> ,x :bn<CR>

" Window/Tab/Split Manipulation {{{
" Move between split windows by using the four directions H, L, I, N
" (note that  I use I and N instead of J and K because  J already does
" line joins and K is mapped to GitGrep the current word
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-j> <C-w>j

" Zoom in and out of current window with ,gz
map <silent> ,gz <C-w>o

" Create window splits easier. The default
" way is Ctrl-w,v and Ctrl-w,s. I remap
" this to vv and ss
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" Resize windows with arrow keys
nnoremap <D-Up>    <C-w>+
nnoremap <D-Down>  <C-w>-
nnoremap <D-Left>  <C-w><
nnoremap <D-Right> <C-w>>

cmap Tabe tabe

" Use numbers to pick the tab you want (like iTerm)
map <silent> <D-1> :tabn 1<cr>
map <silent> <D-2> :tabn 2<cr>
map <silent> <D-3> :tabn 3<cr>
map <silent> <D-4> :tabn 4<cr>
map <silent> <D-5> :tabn 5<cr>
map <silent> <D-6> :tabn 6<cr>
map <silent> <D-7> :tabn 7<cr>
map <silent> <D-8> :tabn 8<cr>
map <silent> <D-9> :tabn 9<cr>

" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Adjust viewports to the same size
map <Leader>= <C-w>=

" }}}

" Stupid shift key fixes {{{
command! -bang -nargs=* -complete=file E e<bang> <args>
command! -bang -nargs=* -complete=file W w<bang> <args>
command! -bang -nargs=* -complete=file Wq wq<bang> <args>
command! -bang -nargs=* -complete=file WQ wq<bang> <args>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>
" }}}

" Code folding options {{{
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>
" }}}

" Some helpers to edit mode
" http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Easier horizontal scrolling
map zl zL
map zh zH

" create <%= foo %> erb tags using Ctrl-k in edit mode
" imap <silent> <C-K> <%=   %><Esc>3hi

" create <%= foo %> erb tags using Ctrl-j in edit mode
" imap <silent> <C-J> <%  %><Esc>2hi

" Shortcuts for everyday tasks {{{

" copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
" this is helpful to paste someone the path you're looking at
nnoremap <silent> ,cf :let @* = expand("%:~")<CR>
nnoremap <silent> ,cn :let @* = expand("%:t")<CR>

" Shortcuts
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv
" }}}

" Fix home and end keybindings for screen, particularly on mac
" - for some reason this fixes the arrow keys too. huh.
map [F $
imap [F $
map [H g0
imap [H g0

"(v)im (c)ommand - execute current line as a vim command
nmap <silent> ,vc yy:<C-f>p<C-c><CR>

"(v)im (r)eload
nmap <silent> ,vr :so %<CR>

" Search highlighting {{{
" Type ,hl to toggle highlighting on/off, and show current value.
noremap ,hl :set hlsearch! hlsearch?<CR>

"Clear current search highlight by double tapping //
nmap <silent> // :nohlsearch<CR>

" Apple-* Highlight all occurrences of current word (like '*' but without moving)
" http://vim.wikia.com/wiki/Highlight_all_search_pattern_matches
nnoremap <D-*> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
" }}}

" These are very similar keys. Typing 'a will jump to the line in the current
" file marked with ma. However, `a will jump to the line and column marked
" with ma.  It’s more useful in any case I can imagine, but it’s located way
" off in the corner of the keyboard. The best way to handle this is just to
" swap them: http://items.sjbach.com/319/configuring-vim-right
nnoremap ' `
nnoremap ` '

nnoremap <silent> <leader>tt :TagbarToggle<CR>
nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>

" CtrlP {{{
nnoremap <silent> ,t :CtrlPMixed<CR>
nnoremap <silent> <D-t> :CtrlP<CR>
nnoremap <silent> <D-r> :CtrlPMRU<CR>

" Additional mapping for buffer search
" nnoremap <silent> ,b :CloseSingleConque<CR>:CtrlPBuffer<cr>
" nnoremap <silent> <C-b> :CloseSingleConque<CR>:CtrlPBuffer<cr>
nnoremap <silent> <C-b> :CtrlPBuffer<cr>

" Cmd-Shift-P to clear the cache
nnoremap <silent> <D-P> :ClearCtrlPCache<cr>

    " Jump to Ruby structures {{{
    " Idea from : http://www.charlietanksley.net/blog/blog/2011/10/18/vim-navigation-with-lustyexplorer-and-lustyjuggler/
    " Open CtrlP starting from a particular path, making it much
    " more likely to find the correct thing first. mnemonic 'jump to [something]'
    " map ,jm :CloseSingleConque<CR>:CtrlP app/models<CR>
    " map ,jc :CloseSingleConque<CR>:CtrlP app/controllers<CR>
    " map ,jv :CloseSingleConque<CR>:CtrlP app/views<CR>
    " map ,jh :CloseSingleConque<CR>:CtrlP app/helpers<CR>
    " map ,jl :CloseSingleConque<CR>:CtrlP lib<CR>
    " map ,jp :CloseSingleConque<CR>:CtrlP public<CR>
    " map ,js :CloseSingleConque<CR>:CtrlP spec<CR>
    " map ,jf :CloseSingleConque<CR>:CtrlP fast_spec<CR>
    " map ,jd :CloseSingleConque<CR>:CtrlP db<CR>
    " map ,jC :CloseSingleConque<CR>:CtrlP config<CR>
    " map ,jV :CloseSingleConque<CR>:CtrlP vendor<CR>
    " map ,jF :CloseSingleConque<CR>:CtrlP factories<CR>
    " map ,jT :CloseSingleConque<CR>:CtrlP test<CR>

    "Cmd-(m)ethod - jump to a method (tag in current file)
    " map ,m :CloseSingleConque<CR>:CtrlPBufTag<CR>

    "Ctrl-(M)ethod - jump to a method (tag in all files)
    " map ,M :CloseSingleConque<CR>:CtrlPBufTagAll<CR>
    " }}}
" }}}

 " Fugitive {{{
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gw :Gwrite<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
 " }}}

 " UndoTree {{{
    nnoremap <Leader>u :UndotreeToggle<CR>
 " }}}

" Tabularize {{{
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:<CR>
  vmap <Leader>a: :Tabularize /:<CR>
  nmap <Leader>a:: :Tabularize /:\zs<CR>
  vmap <Leader>a:: :Tabularize /:\zs<CR>
  nmap <Leader>a, :Tabularize /,<CR>
  vmap <Leader>a, :Tabularize /,<CR>
  nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
  vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

  " The following function automatically aligns when typing a
  " supported character
  inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

  function! s:align()
      let p = '^\s*|\s.*\s|\s*$'
      if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
      endif
  endfunction
" }}}

" SplitJoin plugin {{{
    nmap sj :SplitjoinSplit<cr>
    nmap sk :SplitjoinJoin<cr>
" }}}

" vim-ruby-conque {{{
" Cmd-Shift-R for RSpec
" nmap <silent> <D-R> :call RunRspecCurrentFileConque()<CR>
" Cmd-Shift-L for RSpec Current Line
" nmap <silent> <D-L> :call RunRspecCurrentLineConque()<CR>
" ,Cmd-R for Last conque command
" nmap <silent> ,<D-R> :call RunLastConqueCommand()<CR>
" }}}

" Get the current highlight group. Useful for then remapping the color
map ,hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>

" Source current file Cmd-% (good for vim development)
map <D-%> :so %<CR>
nnoremap <leader>. <C-^>
nnoremap / /\v
vnoremap / /\v

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

nnoremap <leader>em <C-w>s<C-w>j<C-w>L:e $MYVIMRC<cr>

" Easier linewise reselection
map <leader>v V`]

" Faster Esc
inoremap <Esc> <nop>
Arpeggio inoremap jk  <Esc>

" Easy filetype switching
nnoremap <leader>T :set ft=tt2<CR>
nnoremap <leader>H :set ft=html<CR>
nnoremap <leader>J :set ft=javascript<CR>
nnoremap <leader>r :set ft=perl.rdor<CR>

" map <leader>p :Hammer<CR>

" Shouldn't need shift
nnoremap ; :

" Reuse useless help key.
noremap  <F1> :set invfullscreen<CR>
inoremap <F1> <ESC>:set invfullscreen<CR>a

" ,hp = html preview
map <silent> ,hp :!open -a Safari %<CR><CR>

" Title Case A Line Or Selection (better)
vnoremap <F6> :s/\%V\<\(\w\)\(\w*\)\>/\u\1\L\2/e<CR>

" Tag the visual selection as a link
" vnoremap <F7> :s/\(\%V.*\%V.\)/<a href="#ix1">\1<\/a>/<CR>
" Tag the visual selection as a destination
vnoremap <F7> :s/\(\%V.*\%V.\)/<span id="ix1">\1<\/span>/<CR>
" Replace the tag id with contents of register y
noremap <F8> :s/ix\d\+/\=@y/<CR>
" Increment the tag id (uses register y)
" noremap <F11> :s/ix\d\+/\='ix'.(@y+setreg('y',@y+1))/<CR>

" vim:ts=2:sw=2:ai:et
