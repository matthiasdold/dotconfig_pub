" Configurations not in lua but vimscript for various reasons
" This is sourced from unit.lua"

"----------------------------------------------------------
"-- Custom highlighting
"----------------------------------------------------------
syn region pythonDocstring  start=+^\s*[uU]\?[rR]\?"""+ end=+"""+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
syn region pythonDocstring  start=+^\s*[uU]\?[rR]\?'''+ end=+'''+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
hi def link pythonDocstring pythonComment

"----------------------------------------------------------
"-- Removing trailing whitespace on save -> TODO: to lua?
"----------------------------------------------------------
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


"----------------------------------------------------------
"-- nicer execution of python files -> TODO: to lua?
"----------------------------------------------------------
" custom cmd for running the current script with ipython
" Not working like this but on manual run of :term ipython %"
autocmd FileType python vnoremap <buffer> <C-x> :term python %<CR>

"----------------------------------------------------------
"-- Config for the autocompletion
"----------------------------------------------------------
" "autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics()

" ---> highlight references to the same variable"
"autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
"autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
"autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()

"   if executable('pyls')
"       " pip install python-language-server
"       au User lsp_setup call lsp#register_server({
"           \ 'name': 'pyls',
"           \ 'cmd': {server_info->['pyls']},
"           \ 'allowlist': ['python'],
"           \ })
"   endif
"   
"   function! s:on_lsp_buffer_enabled() abort
"       setlocal omnifunc=lsp#complete
"       setlocal signcolumn=yes
"       if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
"       nmap <buffer> gd <plug>(lsp-definition)
"       nmap <buffer> gs <plug>(lsp-document-symbol-search)
"       nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
"       nmap <buffer> gr <plug>(lsp-references)
"       nmap <buffer> gi <plug>(lsp-implementation)
"       nmap <buffer> gt <plug>(lsp-type-definition)
"       nmap <buffer> <leader>rn <plug>(lsp-rename)
"       nmap <buffer> [g <plug>(lsp-previous-diagnostic)
"       nmap <buffer> ]g <plug>(lsp-next-diagnostic)
"       nmap <buffer> K <plug>(lsp-hover)
"       inoremap <buffer> <expr><c-f> lsp#scroll(+4)
"       inoremap <buffer> <expr><c-d> lsp#scroll(-4)
"   
"       let g:lsp_format_sync_timeout = 1000
"       autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
"       
"       " refer to doc to add more commands
"   endfunction
"   
"   augroup lsp_install
"       au!
"       " call s:on_lsp_buffer_enabled only for languages that has the server registered.
"       autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
"   augroup END
