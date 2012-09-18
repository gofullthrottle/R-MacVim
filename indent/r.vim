if exists("b:did_r_indent")
    finish
endif
let b:did_r_indent = 1

setlocal indentkeys=0{,0},:,!^F,o,O,e
setlocal indentexpr=GetRIndent()

let s:open_pat = '\\\@<!\%({\)'
let s:close_pat = '\\\@<!\%(}\)'


function! s:CountMatches(str, pat)
	return len(substitute(substitute(a:str, a:pat, "\n", 'g'), "[^\n]", '', 'g'))
endfunction


function! s:ComputeLevel(lnum_prev, lnum_curr)

	let line_curr = getline(a:lnum_curr)
	let line_prev = getline(a:lnum_prev)
	" strip comments
	let line_prev = substitute(line_prev, '#.*', '', 'g')

	" find unmatched opening patterns on previous line
	let n = s:CountMatches(line_prev, s:open_pat)-s:CountMatches(line_prev, s:close_pat)
	let n += s:CountMatches(line_prev, s:list_open_pat)-s:CountMatches(line_prev, s:list_close_pat)

	" reduce indentation if current line starts with a closing pattern
	if line_curr =~ '^\s*\%(' . s:close_pat . '\)'
		let n -= 1
	endif

	" compensate indentation if previous line starts with a closing pattern
	if line_prev =~ '^\s*\%(' . s:close_pat . '\)'
		let n += 1
	endif

    return n
endfunction

function GetRIndent()
	let lnum_curr = v:lnum
	let lnum_prev = prevnonblank(lnum_curr - 1)

	if lnum_prev == 0
		return 0
	endif

	let n = s:ComputeLevel(lnum_prev,lnum_curr)

	return indent(lnum_prev) + n * &sw

endfunction
