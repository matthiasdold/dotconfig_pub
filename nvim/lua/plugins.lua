--Bootstrapping for the package manager -> install on any system which contains
-- this config
local execute = vim.api.nvim_command local fn = vim.fn


local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}
    -- Asynchroneous jobs
    -- Lazy loading:
    -- Load on specific commands
    use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

    -- Better syntax higlighting
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/playground'
    -- use 'JoosepAlviste/nvim-ts-context-commentstring'    -- nice way of commenting in different languages -> usig <g-c-c> key combo
    use { 'numToStr/Comment.nvim' }
    use {"windwp/nvim-ts-autotag", opt = true}
    use {'lukas-reineke/indent-blankline.nvim'}

    -- statusline
    -- use {
    --     'glepnir/galaxyline.nvim',
    --     branch = 'main',
    --     config = function() require'galaxyline' end,
    -- }
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Finding files
    use {"nvim-lua/plenary.nvim"}
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
        }

    -- tab bars
    use 'romgrk/barbar.nvim'

    -- Icons, "use"
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

    -- nerd tree but nicer
    -- Actually a bit slow -> maybe replace
    -- use 'kyazdani42/nvim-tree.lua'

    use({
        "ms-jpq/chadtree",
        branch = "chad",
        run = ":CHADdeps",
    })

    -- Colorshemes
    -- You can alias plugin names
    -- use {'dracula/vim', as = 'dracula'}
    use {'arcticicestudio/nord-vim'}
    use 'sainnhe/sonokai'
    use 'sainnhe/forest-night'
    use 'tyrannicaltoucan/vim-deep-space'
    use 'jacoborus/tender.vim'

    -- Preview Colors
    use 'norcalli/nvim-colorizer.lua'

    -- Advanced syntax higlighting
    -- use 'sheerun/vim-polyglot' try to disable / potential issues with
    -- treesitter???
    -- definitely faster without

    -- Debugger
    use {'mfussenegger/nvim-dap'}

    -- LSPs
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use "jose-elias-alvarez/null-ls.nvim"  -- looks usefull

    use 'glepnir/lspsaga.nvim'
    -- use {'onsails/lspkind-nvim'}

    -- Autocompletion
    -- cmp plugins
    use 'hrsh7th/cmp-nvim-lsp'
    -- use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/nvim-cmp" -- The completion plugin

    use {'hrsh7th/cmp-vsnip'}
    use {'hrsh7th/vim-vsnip'}
    use {'hrsh7th/vim-vsnip-integ'}
    use {'honza/vim-snippets'}
    -- use {'cstrap/python-snippets'}
    use {'SirVer/ultisnips'}
    use "quangnguyen30192/cmp-nvim-ultisnips"
    use { 'L3MON4D3/LuaSnip' }

    use {"ray-x/lsp_signature.nvim"}

    -- General various
    use {'windwp/nvim-autopairs'}

    -- REPL
    use 'hkupty/iron.nvim'
    -- use 'kassio/neoterm'
    -- NOTE on neoterm -> actually this looks like the better tool for my use
    -- case, but I could not get to work, that I can send a function (multiline)
    -- and it is evaluated straight away (like I achieved in vimteractive with the
    -- extra code) 

    -- matlab
    use 'rahlir/nvim-matlab'

    -- startify
    use 'mhinz/vim-startify'

    -- Markdown
    use 'iamcco/markdown-preview.nvim'
    use { 'ixru/nvim-markdown' }
    -- use { 'ellisonleao/glow.nvim' }     -- Note the additional manual steps noted on the git page

    -- Nicer python indentation
    use 'Vimjas/vim-python-pep8-indent'

    -- Multi coursor: https://github.com/mg979/vim-visual-multi/wiki/Quick-start
    use 'mg979/vim-visual-multi'

    -- Improved folding for python
    use 'tmhedberg/SimpylFold'

    -- Others
    use 'airblade/vim-rooter'        -- look for project root and follow

 
end)


-- A nice initial list of plugins and their usage
-- https://github.com/siduck76/neovim-dots
