-- vim.cmd('colorscheme nord')
-- vim.cmd('let g:nord_termcolors=256')
-- vim.cmd('let g:nord_italic = 1')
-- vim.cmd('let g:nord_italic_comments = 1')

vim.cmd('syntax on')
vim.cmd('colorscheme nord')

--Set Vim-specific sequences for RGB colors
-- vim.cmd('let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"')
-- vim.cmd('let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"')

vim.cmd('let g:nord_termcolors=256')
vim.cmd('let g:nord_italic=1')
vim.cmd('let g:nord_italic_comments=1')
vim.cmd('hi LineNr ctermbg=NONE guibg=NONE')
vim.cmd('hi Normal ctermbg=NONE guibg=NONE')
vim.cmd('hi SignColumn ctermbg=NONE guibg=NONE')

-- O is the global options object
-- vim.cmd('colorscheme ' .. O.colorscheme)
