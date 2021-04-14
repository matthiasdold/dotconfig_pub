--Bootstrapping for the package manager -> install on any system which contains
-- this config
local execute = vim.api.nvim_command local fn = vim.fn


local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}
    -- Asynchroneous jobs
    -- Lazy loading:
    -- Load on specific commands
    use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

    -- Better syntax higlighting
    -- Post-install/update hook with neovim command
    -- NOTE: Hook did not work for me, I had to run manually
    use 'nvim-treesitter/nvim-treesitter'
    use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}

    -- statusline
    use {
        'glepnir/galaxyline.nvim',
	branch = 'main',
	config = function() require'galaxyline' end,
    }

    -- tab bars
    use 'romgrk/barbar.nvim'

    -- Icons, "use"
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

    -- nerd tree but nicer
    use 'kyazdani42/nvim-tree.lua'

    -- Colorshemes
    -- You can alias plugin names
    -- use {'dracula/vim', as = 'dracula'}
    -- Note: christians pack includes nord, which we use
    use 'christianchiarulli/nvcode-color-schemes.vim'
    -- use {'arcticicestudio/nord-vim'}
    use 'sainnhe/sonokai'
    use 'sainnhe/forest-night'
    use 'tyrannicaltoucan/vim-deep-space'
    use 'jacoborus/tender.vim'

    -- Preview Colors
    use 'norcalli/nvim-colorizer.lua'

    -- Advanced syntax higlighting
    use 'sheerun/vim-polyglot'

    -- Debugger
    use {'mfussenegger/nvim-dap'}

    -- LSPs
    use {'neovim/nvim-lspconfig'}
    use 'glepnir/lspsaga.nvim'
    use {'onsails/lspkind-nvim'}
    use 'kabouzeid/nvim-lspinstall' -- nice :LspInstall functionality
    -- use 'nvim-lua/completion-nvim'
    use 'neoclide/coc.nvim'

    -- Autocompletion
    use {'hrsh7th/nvim-compe'}
    use {'hrsh7th/vim-vsnip'}
    use {'hrsh7th/vim-vsnip-integ'}
    use {'honza/vim-snippets'}
    -- use {'cstrap/python-snippets'}
    use {'SirVer/ultisnips'}

    -- General various
    use {'windwp/nvim-autopairs'}

    -- REPL
    use 'hkupty/iron.nvim'

    -- Gitsigns next to numbers
    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'},
    }

    -- startify
    use 'mhinz/vim-startify'

    -- Markdown
    use 'iamcco/markdown-preview.nvim'

    -- Others
    use 'airblade/vim-rooter'        -- look for project root and follow

 
end)


-- A nice initial list of plugins and their usage
-- https://github.com/siduck76/neovim-dots
