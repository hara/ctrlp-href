" =============================================================================
" File:          autoload/ctrlp/href.vim
" Description:   href extension for ctrlp.vim
" =============================================================================

" Load guard
if ( exists('g:loaded_ctrlp_href') && g:loaded_ctrlp_href )
\ || v:version < 700 || &cp
  finish
endif
let g:loaded_ctrlp_href = 1


" Add this extension's settings to g:ctrlp_ext_vars
"
" Required:
"
" + init: the name of the input function including the brackets and any
"         arguments
"
" + accept: the name of the action function (only the name)
"
" + lname & sname: the long and short names to use for the statusline
"
" + type: the matching type
"   - line : match full line
"   - path : match full line like a file or a directory path
"   - tabs : match until first tab character
"   - tabe : match until last tab character
"
" Optional:
"
" + enter: the name of the function to be called before starting ctrlp
"
" + exit: the name of the function to be called after closing ctrlp
"
" + opts: the name of the option handling function called when initialize
"
" + sort: disable sorting (enabled by default when omitted)
"
" + specinput: enable special inputs '..' and '@cd' (disabled by default)
"
call add(g:ctrlp_ext_vars, {
\ 'init': 'ctrlp#href#init(s:crbufnr)',
\ 'accept': 'ctrlp#href#accept',
\ 'lname': 'href',
\ 'sname': 'href',
\ 'type': 'line',
\ 'enter': 'ctrlp#href#enter()',
\ 'exit': 'ctrlp#href#exit()',
\ 'opts': 'ctrlp#href#opts()',
\ 'sort': 0,
\ 'specinput': 0,
\ })


" Provide a list of strings to search in
"
" Return: a Vim's List
"
function! ctrlp#href#init(crbufnr)
  let input =
  \ filter(map(getbufline(a:crbufnr, 1, '$'),
  \            'matchstr(v:val, ''href="\zs[^"]\+\ze"'')'),
  \        'v:val != ""')
  return input
endfunction


" The action to perform on the selected string
"
" Arguments:
"  a:mode   the mode that has been chosen by pressing <cr> <c-v> <c-t> or <c-x>
"           the values are 'e', 'v', 't' and 'h', respectively
"  a:str    the selected string
"
function! ctrlp#href#accept(mode, str)
  " For this example, just exit ctrlp and run help
  call ctrlp#exit()
  execute 'find' a:str
endfunction


" (optional) Do something before enterting ctrlp
function! ctrlp#href#enter()
endfunction


" (optional) Do something after exiting ctrlp
function! ctrlp#href#exit()
endfunction


" (optional) Set or check for user options specific to this extension
function! ctrlp#href#opts()
endfunction


" Give the extension an ID
let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

" Allow it to be called later
function! ctrlp#href#id()
  return s:id
endfunction


" Create a command to directly call the new search type
"
" Put this in vimrc or plugin/href.vim
" command! CtrlPhref call ctrlp#init(ctrlp#href#id())


" vim:nofen:fdl=0:ts=2:sw=2:sts=2
