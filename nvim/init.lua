--[[
        This is used to source packages and configs
        keeping them separate
        The structure is derived from
        https://github.com/ChristianChiarulli/nvcode

        And the new lua based setup
]]

-- General imports
require('plugins') --lua/plugins.lua
require('colorscheme')
require('globals')
require('settings')
require('utils')
require('keymappings')

require('c_galaxyline')
require('c_compe')
require('c_treesitter')
require('c_lspkind')
require('c_colorizer')
require('barbar')
require('autopairs')
require('c_iron')
require('c_gitsigns')
require('c_startify')

-- Others
require('c_vim_rooter')
require('c_ulti_snippets')

-- LSP
-- require('lspconfig')
require('lsp')
require('lspkind')

-- no more separate init, as this should be dealt by from lspinstall
require('lsp.python-ls')
require('lsp.lua-ls')

-- require('keymappings')
-- Vimscript based configs
vim.cmd('source $HOME/.config/nvim/vim_configs.vim')
vim.cmd [[source $HOME/.config/nvim/keymappings.vim]]