" System specific settings {{{
" Include the system settings
:if filereadable( "/etc/vimrc" )
   source /etc/vimrc
:endif
" }}}

" Coloring {{{
set background=dark
" }}}

" Spacing {{{
set shiftwidth=3
set tabstop=3
set softtabstop=3
set expandtab
" }}}

" UI {{{
set number
set wildmenu

" Display file name at bottom of screen
set statusline=%F
" }}}

" Color identifiers {{{
set colorcolumn=85
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" }}}

" Search specific stuff {{{
set ignorecase

" Space toggles highlighting
let g:highlighting = 0
function! Highlighting()
  if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
    let g:highlighting = 0
    return ":silent nohlsearch\<CR>"
  endif
  let @/ = '\<'.expand('<cword>').'\>'
  let g:highlighting = 1
  return ":silent set hlsearch\<CR>"
endfunction
nnoremap <silent> <expr> <space> Highlighting()
" }}}

set modelines=1
" vim:foldmethod=marker:foldlevel=0
