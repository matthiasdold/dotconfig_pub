-- 
--     vim.o for setting global options
--     vim.bo for setting buffer-scoped options
--     vim.wo for setting window-scoped options
--
-- 	From neovim docs on lua:
-- 	vim.g                                                   *vim.g*
-- 	        Global (|g:|) editor variables.
-- 	vim.b                                                   *vim.b*
-- 	        Buffer-scoped (|b:|) variables for the current buffer.
-- 	vim.w                                                   *vim.w*
-- 	        Window-scoped (|w:|) variables for the current window.
-- 	vim.t                                                   *vim.t*
-- 	        Tabpage-scoped (|t:|) variables for the current tabpage.
-- 	vim.v                                                   *vim.v*
-- 	        |v:| variables.
-- 	vim.env                                                 *vim.env*
-- 	        Environment variables defined in the editor session.

vim.wo.wrap=false                              	--Display long lines as just one line
vim.cmd('set whichwrap+=<,>,[,],h,l')
vim.o.pumheight=10                        	--Makes popup menu smaller
vim.o.fileencoding="utf-8"                  	--The encoding written to file
vim.o.cmdheight=2                         	--More space for displaying messages
vim.o.mouse="a"                             	--Enable your mouse
vim.o.splitbelow=true                          	--Horizontal splits will automatically be below
vim.o.termguicolors=true
vim.o.splitright=true                       	--Vertical splits will automatically be to the right
-- vim.o.t_Co="256"                            	--Support 256 colors --> was raising an error with latest build
vim.o.conceallevel=0                      	--So that I can see `` in markdown files
vim.bo.tabstop=4                           	--Insert 2 spaces for a tab
vim.bo.softtabstop=4                           	--Insert 2 spaces for a tab
vim.bo.shiftwidth=4                        	--Change the number of space characters inserted for indentation
vim.bo.expandtab=true                           --Converts tabs to spaces
vim.bo.autoindent=true                         
vim.wo.number = true
vim.wo.relativenumber = true
-- vim.wo.cursorline=true                          --Enable highlighting of the current line
-- vim.o.showtabline=2                       	--Always show tabs
-- vim.g.foldmethod="syntax"
vim.wo.signcolumn="yes"                      	--Always show the signcolumn, otherwise it would shift the text each time
vim.o.updatetime=300                      	--Faster completion
vim.o.timeoutlen=100                      	--By default timeoutlen is 1000 ms
vim.o.clipboard="unnamedplus"               	--Copy paste between vim and everything else

vim.o.filetype="on"                         -- needs to be enabled to to have autocmd based of FileType working

vim.g.asyncomplete_auto_completeopt = 0
-- vim.o.completeopt="menuone,noinsert,noselect"
vim.g.python3_host_prog='/home/doda/workspace/python/venvs/nvim_env/bin/python3.9'
vim.g.node_host_prog='/home/doda/workspace/node/venvs/env/bin/neovim-node-host'
-- For markdown preview, not creating a separate folder
-- TOOD: get this working
--vim.g.mkdp_browser='firefox'
--vim.g.mkdp_auto_open=1
--vim.g.mkdp_auto_close=0


-- Auto close TODO: Get this to work
-- vim.cmd('autocmd VimLeave * :!deactivate_node')
