" ============================================================================
" File:         fishruler.vim
" Description:  Fish text ruler
" Maintainer:   Roman Dolgushin
" Last Changed: 22-05-2013
" Version:      1.1
" ============================================================================

if exists('g:loaded_fishruler')
  if g:loaded_fishruler == 0
    finish
  endif
endif
let g:loaded_fishruler = 1

let s:save_cpo = &cpo
set cpo&vim

command -narg=* Fish call Fish(<f-args>)
command FishCheatsheet :h fishruler-cheatsheet.txt<Cr>

let s:lorem_src = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

function Fish(...)

  if a:0 > 0
    let length = a:1
  else
    let length = 0
  endif

  let lorem_builded = s:lorem_src

  while len(lorem_builded) < l:length
    let lorem_builded .= s:lorem_src
  endwhile

  let lorem_builded = lorem_builded[0:l:length-1]

  exe "normal a".lorem_builded
endfunction

let &cpo = s:save_cpo
