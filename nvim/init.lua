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
require('settings')
require('utils')
require('keymappings')

require('c_galaxyline')
require('c_compe')
require('treesitter')
require('c_lspkind')
require('colorizer')
require('barbar')
require('autopairs')
require('c_iron')
require('c_gitsigns')
require('c_startify')

-- LSP
require('lspconfig')
require('lsp')
require('lspkind')
require('c_lspinstall')
-- no more separate init, as this should be dealt by from lspinstall
-- require('lsp.python-ls')
-- require('lsp.lua-ls')


-- require('keymappings')
vim.cmd [[source $HOME/.config/nvim/keymappings.vim]]
