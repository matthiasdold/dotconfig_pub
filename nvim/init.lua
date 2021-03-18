--[[
        This is used to source packages and configs
        keeping them separate
        The structure is derived from 
        https://github.com/ChristianChiarulli/nvcode

        And the new lua based setup
]]

-- General imports
require('plugins') --lua/plugins.lua
require('keymappings')
require('colorscheme')
require('settings')
require('utils')

require('doda_galaxyline')
require('doda_compe')
require('doda_treesitter')
require('doda_lspkind')
require('doda_colorizer')
require('doda_barbar')
require('doda_autopairs')

-- LSP
require('lsp.python-ls')


