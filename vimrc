"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" industrialsynthfreak - industrialsynthfreak@privacyrequired.com
" ~/.vimrc for web dev apps
" 04/01/17

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Pathogen

execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" General options

set history=700

filetype plugin on
filetype indent on

set autoread
set hlsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Interface and formatting

colorscheme blacklight

syntax enable
set number
set ts=4
set autoindent
set expandtab
set shiftwidth=4
set cursorline
set showmatch
let python_highlight_all = 1

" Use TAB to complete when typing words, else insert TABs as usual

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction

:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"

" Templates

autocmd BufNewFile *.xml 0r ~/.vim/templates/empty_xml.xml | let IndentStyle = "xml"
autocmd BufNewFile *.html 0r ~/.vim/templates/empty_html.html | let IndentStyle = "html"
autocmd BufNewFile *.sh 0r ~/.vim/templates/bash.template | let IndentStyle = "shell"

" Text wrapping

autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
autocmd BufEnter * match OverLength /\%79v.*/

" Language specific intendation (mostly for bash)

autocmd Filetype shell setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype yaml setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

" Key bindings

" ca - copy all, alias for copying an entire file
nmap <C-A> ggyGG$
