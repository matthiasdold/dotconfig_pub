" Configurations not in lua but vimscript for various reasons
" This is sourced from unit.lua"

highlight ColorColumn guibg=#19191f
highlight Folded guibg=#39393f guifg=#81a1c1 gui=None
highlight Comment gui=italic					
set cc=80

"----------------------------------------------------------
"-- Custom highlighting
"----------------------------------------------------------
syn region pythonDocstring  start=+^\s*[uU]\?[rR]\?"""+ end=+"""+ 
syn region pythonDocstring  start=+^\s*[uU]\?[rR]\?'''+ end=+'''+ 
" keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
hi def link pythonDocstring pythonTSComment 
" --> The above does not work. I should probably tweek a query / .scm file
" For treesitter directly to identify the """<something>""" as a docstring
" Queries are located at ~/.local/share/nvim/site/pack/packer/start/nvim-treesitter/queries/


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
"-- for journaling TODO: to lua?
"----------------------------------------------------------
autocmd BufWritePost 0_combined_journal.md :! bass /home/doda/Documents/journal/sync_back_todos.sh

"----------------------------------------------------------
"-- nicer execution of python files -> TODO: to lua?
"----------------------------------------------------------
" neoterm -> not load compatebility as script is vimscript
"	set nocompatible ---> NOTE I had to get rid of this for the lua/vimscript setup to work
" filetype off
" 
" let &runtimepath.=',$HOME.local/share/nvim/site/pack/packer/start/neoterm'
" 
" filetype plugin on
"
" let g:neoterm_repl_enable_ipython_paste_magic = 1
" let g:neoterm_bracketed_paste = 1
" let g:neoterm_default_mod = "vertical"
" let g:neoterm_repl_python = ["svenv", "clear", "ipython --no-autoindent"]

" SUPER IMPORTANT NOTE: --> these remaps did not work in the lua at all! Same as for iron,
" If time allows, investigate and understand why this is screwed up
" vnoremap <C-s> :TREPLSendSelection<CR>
" nnoremap <C-s> :TREPLSendLine<CR>

" Trying to fix iron
" NOTE: This is super interesting, that the following keymap from lua does not work
" vim.api.nvim_set_keymap('v', '<C-s>', '<Cmd>lua require("iron").core.visual_send()<CR>', { noremap = true})
"
" This might explain other non working keymaps as well --> investigate if time allows
vnoremap <C-s> :lua require("iron").core.visual_send()<CR>
nnoremap <C-s> :lua require("iron").core.send_line()<CR>
