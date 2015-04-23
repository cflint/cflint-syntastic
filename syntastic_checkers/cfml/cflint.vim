if exists("g:loaded_syntastic_cfml_cflint_checker")
	finish
endif
let g:loaded_syntastic_cfml_cflint_checker = 1

"if !exists('g:syntastic_cfml_sort')
	"let g:syntastic_cfml_sort = 1
"endif

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_cfml_IsAvailable() dict
	return executable(self.getExec())
endfunction

"function! SyntaxCheckers_cfml_GetHighLightRegex(item)
	"if match(a:item['text'], 'assigned but not unused variable') > -1
		"let term = split(a:item['text'], ' - ')[1]
		"return '\V\\<'.term.'\\>'
	"endif

	"return ''
"endfunction

function! SyntaxCheckers_cfml_cflint_GetLocList() dict
	let makeprg = self.makeprgBuild({
				\ 'args': '-file',
				\ 'args_after': '-text' })

	let errorformat = '%f:%l [%t] %m'

	let env = { 'CFMLOPT': '' }

	return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat, 'env': env })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
			\ 'filetype': 'cfml',
			\ 'name': 'cflint' })

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: set sw=4 sts=4 et fdm=marker:

