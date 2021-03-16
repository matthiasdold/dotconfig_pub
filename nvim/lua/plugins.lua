--Bootstrapping for the package manager -> install on any system which contains
-- this config
local execute = vim.api.nvim_command
local fn = vim.fn

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
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- statusline
    use {
        'glepnir/galaxyline.nvim',
	branch = 'main',
	config = function() require'doda_galaxyline' end,
    }

    -- nerd tree but nicer
    use {'kyazdani42/nvim-web-devicons'} 
    use {'kyazdani42/nvim-tree.lua'}

    -- Colorshemes
    -- You can alias plugin names
    use {'dracula/vim', as = 'dracula'}
    use {'arcticicestudio/nord-vim'}

    -- Autocompletion
    -- Load on a combination of conditions: specific filetypes or commands
    -- Also run code after load (see the "config" key)
    use {
         'w0rp/ale',
          ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
          cmd = 'ALEEnable',
          config = 'vim.cmd[[ALEEnable]]'
    }

    -- LSPs
    use {'neovim/nvim-lspconfig'}
    --use {'hrsh7th/nvim-compe'}
    --use {'hrsh7th/vim-vsnip'}
end)


-- A nice initial list of plugins and their usage
-- https://github.com/siduck76/neovim-dots
