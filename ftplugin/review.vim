function! ReVIEWCaption(level)
  let level = a:level
  let orig = getline(".")
  let repl = substitute(orig, '^=*\s*', " ", "")
  while level > 0
    let repl = "=" . repl
    let level = level - 1
  endwhile
  call append(".", repl)
  execute ":d"
endfunction
function! ReVIEWEndOfBlock(line)
  call append(a:line, "//}")
endfunction
function! ReVIEWList() range
  call ReVIEWEndOfBlock(a:lastline)
  call append(a:firstline-1, '//list[][]{')
endfunction
function! ReVIEWEmlist() range
  call ReVIEWEndOfBlock(a:lastline)
  call append(a:firstline-1, '//emlist{')
endfunction
function! ReVIEWCmd() range
  call ReVIEWEndOfBlock(a:lastline)
  call append(a:firstline-1, '//cmd{')
endfunction
map gh1 :call ReVIEWCaption(1)
map gh2 :call ReVIEWCaption(2)
map gh3 :call ReVIEWCaption(3)
map gh4 :call ReVIEWCaption(4)
map gl :call ReVIEWList()
map ge :call ReVIEWEmlist()
map gc :call ReVIEWCmd()

call SurroundRegister('b', 't', "@<tt>{\r}")
call SurroundRegister('b', 'k', "@<kw>{\r}")
call SurroundRegister('b', 'f', "@<fn>{\r}")
call SurroundRegister('b', 'l', "@<list>{\r}")
call SurroundRegister('b', 'i', "@<i>{\r}")

