-- leader to space
vim.g.mapleader=','
vim.g.maplocalleader=','

-- quick save
vim.api.nvim_set_keymap('n', '<localleader>w', ':w<CR>', { noremap = true, silent = true })

-- explorer
vim.cmd('inoremap <expr> <C-n> :NvimTreeToggle<CR>')
vim.api.nvim_set_keymap('n', '<localleader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- better window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { silent = true })


-- coding with german keyboard
vim.api.nvim_set_keymap('i', '<C-h>', '[]<left>', { silent = true, noremap = true})
vim.api.nvim_set_keymap('i', '<C-l>', ']', { silent = true, noremap = true})
vim.api.nvim_set_keymap('i', '<C-s>', '{}<left>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('i', '<C-g>', '}', { silent = true, noremap = true })
vim.api.nvim_set_keymap('i', '{', '{}<left>', { silent = true, noremap = true })
vim.api.nvim_set_keymap('i', '[', '[]<left>', { silent = true, noremap = true })

-- Resize window
vim.api.nvim_set_keymap('n', '<C-Left>', ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>', ':resize +2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Up>', ':resize -2<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true })


-- Tab switch buffer
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', { noremap = true, silent = true })

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true, silent = true })

-- Better nav for omnicomplete
vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')

-- Iron vim
vim.api.nvim_set_keymap('n', '<C-S>', '<Cmd>lua require("iron").core.send(vim.api.nvim_buf_get_option(0,"ft"), vim.api.nvim_buf_get_lines(0, 0, -1, false))<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', '<Cmd>lua require("iron").core.send_line()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-s>', '<Cmd>lua require("iron").core.send_visual()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', { noremap = true, silent = true })     -- terminal mode remap

-- Other interactive
-- vim.cmd('autocmd FileType python vnoremap <silent> <C-s> m`""y:call vimteractive#sendlines(substitute(getreg(\'"\'), "\n*$", "", "")."\n")<CR>``')
