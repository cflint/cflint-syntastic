"============================================================================
"File:        cflint.vim
"Description: Syntax checking plugin for cflint-syntastic
"
"============================================================================
" See http://vimdoc.sourceforge.net/htmldoc/quickfix.html#efm-ignore
"
" Sample Follows
"
"
" Severity:ERROR
" Message code:PARSE_ERROR
" 	File:/home/displague/t.cfm
" 	Column:8
" 	Line:2
" 		Message:Unable to parse
" 		Variable:'null' in function:
" 		Expression:[@5,9:9=';',<65>,2:8]
"

if exists("g:loaded_syntastic_cfml_cflint_checker")
    finish
endif

let g:loaded_syntastic_cfml_cflint_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_cfml_IsAvailable() dict " {{{1
	return executable(expand(self.getExec(), 1))
endfunction " }}}1

"function! SyntaxCheckers_cfml_GetHighLightRegex(item)
	"if match(a:item['text'], 'assigned but not unused variable') > -1
		"let term = split(a:item['text'], ' - ')[1]
		"return '\V\\<'.term.'\\>'
	"endif

	"return ''
"endfunction

" @vimlint(EVL104, 1, l:errorformat)
function! SyntaxCheckers_cfml_cflint_GetLocList() dict " {{{1
	let makeprg = self.makeprgBuild({
				\ 'args': '-q -text',
				\ 'args_after': '-file' })

	let errorformat =
		\ '%-GPicked%.%#,'.
		\ '%-Gline%.%#,'.
		\ '%-GStage%.%#,'.
		\ '%-Gline%.%#,'.
		\ '%-GIssue%.%#,'.
		\ '%ESeverity:ERROR'.','.
		\ '%ESeverity:FATAL'.','.
		\ '%ESeverity:CRITICAL'.','.
		\ '%WSeverity:WARNING'.','.
		\ '%WSeverity:CAUTION'.','.
		\ '%ISeverity:INFO'.','.
		\ '%ISeverity:COSMETIC'.','.
		\ '%CMessage code:%.%#'.','.
		\ '%C%\tFile:%f'.','.
		\ '%C%\tColumn:%c'.','.
		\ '%C%\tLine:%l'.','.
		\ '%C%\t%\tMessage:%m'.','.
		\ '%C%\t%\tVariable:'."'".'%.%#'."'".' in function\: %.%#'.','.
		\ '%Z%\t%\tExpression:%.%#'.','.
		\ '%-G%.%#'

	" Other lines should be hidden
	"let errorformat .= '%-G%.%#'

	if !exists('g:syntastic_cfml_cflint_sort')
	    let g:syntastic_cfml_cflint_sort = 1
	endif

	let env = { 'CFMLOPT': '' }

	return SyntasticMake({
		\ 'makeprg': makeprg,
		\ 'errorformat': errorformat,
		\ 'env': env })
endfunction " }}}1
" @vimlint(EVL104, 0, l:errorformat)

call g:SyntasticRegistry.CreateAndRegisterChecker({
			\ 'filetype': 'cfml',
			\ 'name': 'cflint' })

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=4 sts=4 et fdm=marker:

