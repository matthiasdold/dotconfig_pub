--[[
        This is used to source packages and configs
        keeping them separate
        The structure is derived from
        https://github.com/ChristianChiarulli/nvcode

        And the new lua based setup
]]

-- Use the vimscript stuff here first, as the neoterm needs to happen
-- before syntax on
require('plugins') --lua/plugins.lua

vim.cmd('source $HOME/.config/nvim/vim/vim_configs.vim')
require('colorscheme')

-- General imports
require('globals')
require('settings')
require('utils')
require('keymappings')

require('c_galaxyline')
-- require('c_compe')
require('c_treesitter')
require('c_lspkind')
require('c_colorizer')
require('barbar')
require('autopairs')
require('c_iron')
-- require('neoterm')
require('c_gitsigns')
require('c_startify')

-- Others
-- require('c_vim_rooter')
require('c_ulti_snippets')
-- require('c_telescope')

-- LSP --> trying to do this with CoC now
-- require('lspconfig')
-- require('lsp')
require('lspkind')
-- via vim_configs.vim --> TODO: translate to lua

-- require('lsp.python-ls')
-- require('lsp.lua-ls')

-- require('keymappings')
-- Vimscript based configs
vim.cmd [[source $HOME/.config/nvim/vim/coc.vim]]
vim.cmd [[source $HOME/.config/nvim/vim/vim_matlab.vim]]
