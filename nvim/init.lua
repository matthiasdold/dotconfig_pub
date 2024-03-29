--[[
        This is used to source packages and configs
        keeping them separate
        The structure is derived from
        https://github.com/ChristianChiarulli/nvcode

        And the new lua based setup
]]

require('plugins') --lua/plugins.lua

require('colorscheme')

-- General imports
require('globals')
require('settings')
require('utils')
require('keymappings')
require('c_cmp')

--require('c_galaxyline')

require('c_lualine')
require('c_treesitter')
-- require('c_treesitter_context')       -- sticky header of functions etc -- not working as of 2022-09-03 retry another time
require('c_hexokinase')

require('barbar')
require('autopairs')
-- require('c_iron')

-- require('neoterm')
-- require('c_gitsigns')

require('c_startify')
require('c_nvimtree')
--require('chadtree')

-- Neogit offers some nice functionality, but slows nvim down considerably
-- TODO: Try fugitive again
-- require('c_neogit')           // testging if this is what makes nvim slow

-- Commenting
require('c_comment')
-- require('Comment').setup()      -- default setup


-- Others
require('c_rooter')                 -- change root on file open -- not yet a good config
require('c_ulti_snippets')
require('luasnip')
require('c_telescope')              -- fuzzy finding

-- Completion and LSP
require('lsp')

-- Others
require('spellsitter').setup()

-- require('lsp.python-ls')
-- Vimscript based configs
vim.cmd('source $HOME/.config/nvim/vim/vim_configs.vim')
vim.cmd [[source $HOME/.config/nvim/vim/vim_matlab.vim]]
