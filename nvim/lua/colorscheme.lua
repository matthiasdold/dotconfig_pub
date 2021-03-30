-- vim.cmd('colorscheme nord')
-- vim.cmd('let g:nord_termcolors=256')
-- vim.cmd('let g:nord_italic = 1')
-- vim.cmd('let g:nord_italic_comments = 1')

vim.cmd('syntax on')
vim.cmd('colorscheme nord')
vim.cmd('let g:nord_termcolors=256')
vim.cmd('let g:nord_italic=1')
vim.cmd('let g:nord_italic_comments=1')
vim.cmd('hi LineNr ctermbg=NONE guibg=NONE')

vim.api.nvim_exec(
[[augroup nord-theme-overrides
    autocmd!
    autocmd ColorScheme nord hi Folded guibg=NONE 
    autocmd ColorScheme nord hi Normal guibg=NONE ctermbg=NONE  "transparent bg to not use vim settings but STs

augroup END

]], false
)

-- O is the global options object
-- vim.cmd('colorscheme ' .. O.colorscheme)
